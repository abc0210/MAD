xml file sign up

<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/textView2"
        android:layout_width="91dp"
        android:layout_height="31dp"
        android:text="Password"
        android:textAlignment="center"
        android:textStyle="bold"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.087"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.535" />

    <TextView
        android:id="@+id/editTextTextPersonName"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:ems="10"
        android:inputType="textPersonName"
        android:text="SIGN UP"
        android:textAlignment="center"
        android:textSize="24sp"
        android:textStyle="bold"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.497"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.135" />

    <TextView
        android:id="@+id/textView"
        android:layout_width="91dp"
        android:layout_height="31dp"
        android:text="UserName"
        android:textAlignment="center"
        android:textStyle="bold"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.087"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.391" />

    <EditText
        android:id="@+id/txt_username"
        android:layout_width="220dp"
        android:layout_height="55dp"
        android:ems="10"
        android:inputType="textPersonName"
        android:text="Name"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.761"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.379" />

    <EditText
        android:id="@+id/txt_password"
        android:layout_width="219dp"
        android:layout_height="62dp"
        android:ems="10"
        android:inputType="textPassword"
        android:text="**"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.766"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.526" />

    <Button
        android:id="@+id/btn_signup"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Sign Up"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.498"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.758" />

</androidx.constraintlayout.widget.ConstraintLayout>


java file sign up

package com.example.log;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class MainActivity extends AppCompatActivity implements View.OnClickListener
{
    EditText txtUsername;
    EditText txtPassword;
    Button btnSignup;
    String regularExpression ="^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!])[A-Za-z\\d@$!]{8,}$";
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        txtUsername=(EditText)findViewById(R.id.txt_username);
        txtPassword=(EditText)findViewById(R.id.txt_password);
        btnSignup=(Button)findViewById(R.id.btn_signup);
        btnSignup.setOnClickListener(this);

    }

    @Override
    public void onClick(View v)
    {
        String username=txtUsername.getText().toString();
        String password=txtPassword.getText().toString();
        if(validatePassword(password))
        {
            Bundle bundle = new Bundle();
            bundle.putString("rnsit", username);
            bundle.putString("Lab@2020", password);
            Intent it = new Intent(this, LoginActivity.class);
            it.putExtra("data", bundle);
            startActivity(it);
        }


        else
        {
            Toast.makeText(getBaseContext(), "Invalid Password",Toast.LENGTH_LONG).show();
        }
    }



    public boolean validatePassword(String password)
    {
        Pattern pattern=Pattern.compile(regularExpression);
        Matcher matcher=pattern.matcher(password);
        return matcher.matches();
    }
}


login xml

<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".LoginActivity">
    <TextView
        android:id="@+id/textView7"
        android:layout_width="70dp"
        android:layout_height="36dp"
        android:layout_marginTop="112dp"
        android:text="Login"
        android:textStyle="bold"
        android:textColor="#ED3B3B"
        android:textSize="24dp"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.498"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

    <TextView
        android:id="@+id/textView9"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="36dp"
        android:layout_marginTop="96dp"
        android:text="Username"
        android:textAllCaps="true"
        android:textColor="#100F0F"
        android:textSize="16sp"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/textView7" />

    <EditText
        android:id="@+id/txt_login_username"
        android:layout_width="227dp"
        android:layout_height="68dp"
        android:layout_marginStart="20dp"
        android:layout_marginEnd="20dp"
        android:ems="10"
        android:inputType="textPersonName"
        android:text="user"
        android:textColor="#A39393"
        app:layout_constraintBottom_toBottomOf="@+id/textView9"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.375"
        app:layout_constraintStart_toEndOf="@+id/textView9"
        app:layout_constraintTop_toTopOf="@+id/textView9"
        app:layout_constraintVertical_bias="0.521" />

    <TextView
        android:id="@+id/textView10"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="36dp"
        android:layout_marginTop="120dp"
        android:text="PASSWORD"
        android:textColor="#000000"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/textView9" />

    <EditText
        android:id="@+id/txt_login_password"
        android:layout_width="221dp"
        android:layout_height="55dp"
        android:layout_marginTop="8dp"
        android:ems="10"
        android:inputType="textPassword"
        android:shadowColor="#E6D9D9"
        android:text="pass"
        android:textColor="#C8BABA"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.784"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.544" />

    <Button
        android:id="@+id/btn_login_signin"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="68dp"
        android:text="Login"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.498"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/txt_login_password" />


</androidx.constraintlayout.widget.ConstraintLayout>


login java file

package com.example.log;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class LoginActivity extends AppCompatActivity implements View.OnClickListener
{
    EditText  txtLoginUsername;
    EditText txtLoginPassword;
    Button btnLogin;
    String user,pass;
    int count=0;


    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        txtLoginUsername=(EditText) findViewById(R.id.txt_login_username);
        txtLoginPassword=(EditText) findViewById(R.id.txt_login_password);
        btnLogin=(Button)findViewById(R.id.btn_login_signin);
        btnLogin.setOnClickListener(this);
        Bundle bundle=getIntent().getBundleExtra("data");
        user=bundle.getString("rnsit");
        pass=bundle.getString("Lab@2020");

    }

    @Override
    public void onClick(View view)
    {
        String user1=txtLoginUsername.getText().toString();
        String pass1=txtLoginPassword.getText().toString();
        if(user.equals(user1)&&pass.equals(pass1))
        {
            Toast.makeText(this,"Login Successful" ,Toast.LENGTH_LONG).show();
        }
        else
        {
            count++;
            if(count==3)
            {
                btnLogin.setEnabled(false);
                Toast.makeText(this, "Failed Login Attempts",Toast.LENGTH_LONG).show();
            }
            else
            {
                Toast.makeText(this,"Login Failed "+count ,Toast.LENGTH_LONG).show();
            }
        }
    }
}
