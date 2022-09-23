import Foundation
import PackagePlugin

@main
struct BranchPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let packageDirectory = context.package.directory
        let outputFilesDirectory = context.pluginWorkDirectory
        let outputFile = outputFilesDirectory.appending("Branch.generated.swift")
        let scriptFile = target.directory.appending("current_branch.sh")

        return [
            .prebuildCommand(
                displayName: "Generating current git branch-name property",
                executable: scriptFile,
                arguments: [
                    packageDirectory.string,
                    outputFile.string
                ],
                outputFilesDirectory: outputFilesDirectory
            )
        ]
    }
}
