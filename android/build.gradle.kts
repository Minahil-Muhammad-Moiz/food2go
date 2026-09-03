allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

// Safely override SDK levels regardless of current project evaluation state
subprojects {
    val configureAction = Action<Project> {
        if (extensions.findByName("android") != null) {
            configure<com.android.build.gradle.BaseExtension> {
                compileSdkVersion(36)
            }
        }
    }

    // If already evaluated, execute now. Otherwise, hook into afterEvaluate.
    if (state.executed) {
        configureAction.execute(this)
    } else {
        afterEvaluate(configureAction)
    }
}
