# Roo Code Memory Bank: Project Brief

**Maintain Project Context Across Sessions and Memory Resets for Consistent AI-Assisted Development**

This guide will walk you through using the Roo Code Memory Bank system. This powerful system, enhanced by Roo Code's built-in context-preserving features, provides a robust solution for managing project context across development sessions and seamlessly handling Roo's periodic memory resets.  By implementing the Memory Bank, you will ensure that Roo Code remains consistently informed about your project, leading to more effective and reliable AI-assisted coding.

**Understanding Roo Code's Built-in Context Features**

Recent updates to Roo Code incorporate built-in features designed to preserve context *within a single VS Code workspace session*. These are valuable enhancements to your workflow:

*   **Chat History Persistence:** Roo Code intelligently remembers your chat history within a VS Code workspace.  This means that if you close and reopen VS Code, or switch between files within the same project folder/workspace, your ongoing chat conversations are automatically restored, providing continuity within a session.
*   **Workspace Awareness:** Roo Code is now deeply aware of your VS Code workspace environment, including open files and the overall project structure. This allows it to understand the codebase more effectively and provide more contextually relevant and accurate responses during your development session.

**Key Point: Built-in Features Enhance, But Don't Replace, the Core Need for the Memory Bank**

While these built-in features significantly improve *in-session* context retention, they **do not eliminate** the fundamental need for the Roo Code Memory Bank. Roo Code still operates with periodic internal memory resets.  The Memory Bank system remains absolutely crucial for:

*   **Ensuring Persistence Across Roo's Memory Resets:**  Roo Code's internal memory can undergo resets even within an active VS Code session. The Memory Bank acts as your external, reliable long-term memory, guaranteeing context survival beyond these resets.
*   **Building Long-Term Project Knowledge:** The Memory Bank provides a structured, well-documented repository for capturing and organizing vital project knowledge. This includes architectural decisions, key technical context, design patterns, and ongoing progress tracking – going far beyond simple chat history to create a comprehensive project knowledge base.
*   **Establishing an Explicit Mode-Based Workflow:** The Memory Bank system defines clear and structured workflows for utilizing Roo Code's Architect, Code, and Ask modes. These workflows are specifically designed to actively manage and leverage project knowledge stored within the Memory Bank for each development phase.
*   **Implementing Project-Specific Rules with `.clinerules`:** The Memory Bank system uniquely incorporates `.clinerules` files. These powerful files allow you to define and consistently enforce project-specific rules and coding patterns, a capability that Roo Code's built-in features alone cannot provide.

**The Synergistic Power: Memory Bank and Roo Code's Built-in Features Working in Harmony**

Think of the relationship between the Memory Bank and Roo Code's built-in features this way:

*   **Roo Code's built-in features:** Provide valuable *short-term* and *workspace-level* context retention, enhancing the fluidity and convenience of your immediate coding session. They are like short-term memory enhancements for Roo.
*   **Memory Bank System:** Serves as Roo's *long-term* and *structured* persistent memory. It's your external, reliable "brain" for Roo, ensuring consistent project understanding that endures across sessions and memory resets, and providing a framework for organized project knowledge.

By using them together, you unlock a truly powerful and robust development workflow.