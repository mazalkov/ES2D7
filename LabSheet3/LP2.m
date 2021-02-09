classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure             matlab.ui.Figure
        DrawButton           matlab.ui.control.Button
        OrderEditFieldLabel  matlab.ui.control.Label
        OrderEditField       matlab.ui.control.NumericEditField
        UIAxes               matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: DrawButton
        function DrawButtonPushed(app, event)
            order = app.OrderEditField.Value;
            x = -3:0.1:3;
            y = x.^order;
            plot(app.UIAxes, x, y)
            title(app.UIAxes, "Learning Problem 2");
        end

        % Callback function
        function OrderEditFieldValueChanged(app, event)

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create DrawButton
            app.DrawButton = uibutton(app.UIFigure, 'push');
            app.DrawButton.ButtonPushedFcn = createCallbackFcn(app, @DrawButtonPushed, true);
            app.DrawButton.Position = [446 45 100 22];
            app.DrawButton.Text = 'Draw';

            % Create OrderEditFieldLabel
            app.OrderEditFieldLabel = uilabel(app.UIFigure);
            app.OrderEditFieldLabel.HorizontalAlignment = 'right';
            app.OrderEditFieldLabel.Position = [197 45 41 22];
            app.OrderEditFieldLabel.Text = 'Order: ';

            % Create OrderEditField
            app.OrderEditField = uieditfield(app.UIFigure, 'numeric');
            app.OrderEditField.Position = [237 45 100 22];

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [128 118 461 293];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
