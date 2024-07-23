import os
import uvicorn
from vital_agent_container.agent_container_app import AgentContainerApp
from vital_agent_template.vital_agent_handler import VitalAgentHandler


# instantiate app from container sdk using locally defined handler

def create_app():

    print('Hello Agent Container Template')

    current_file_directory = os.path.dirname(os.path.abspath(__file__))

    app_home = current_file_directory

    handler = VitalAgentHandler()

    return AgentContainerApp(handler, app_home)


app = create_app()


if __name__ == "__main__":
    uvicorn.run(host="0.0.0.0", port=6006, app=app)

