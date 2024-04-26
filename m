Return-Path: <linux-kbuild+bounces-1696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDCE8B4016
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Apr 2024 21:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 429B82873CB
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Apr 2024 19:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61061111A8;
	Fri, 26 Apr 2024 19:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJeJsnkL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C18B3FD4
	for <linux-kbuild@vger.kernel.org>; Fri, 26 Apr 2024 19:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714159304; cv=none; b=fn5bov1/VwfMcgrXEDu9pzZhc3uQt8IEkHa/O3XQ9vbYIkjircuB1AdoDcqhxEvEGtxwWM1JX4y1o9XeuKyABcfWTJDz0XCtdeggaVsLulhq5iyFooB+W2FM74HTNiN3FQU+9sBR5G2jUN16nKl3TVutttwyj8OYNih2qXZY0pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714159304; c=relaxed/simple;
	bh=AifMpHzd5hCq3rEYuGjutUJm8xluooWKuYVgKjwUk/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsGe96GXmhLhO2JYFVadEwKn97PSq4EtJevD0+q/6hpzxgqBQsXhs2jJumbNZzIXV1M09+efJ3ZsjTC8DHoRo1z53xM5FJz/luOMH4ynQbQO9kSPrGTZTsRqwGvXeR3V8bdPNmXfkDoRoK5eCUaCi8b6uojnBF32G3UU54wgBTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJeJsnkL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51FFC2BD11
	for <linux-kbuild@vger.kernel.org>; Fri, 26 Apr 2024 19:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714159303;
	bh=AifMpHzd5hCq3rEYuGjutUJm8xluooWKuYVgKjwUk/4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BJeJsnkLIfaVRxyPesJPvB/webggsHS6LbqkzeLr1K9J5i1/HsdIKKTkI77+g94xV
	 Bg8QGn3eDBGbcEuS9a/EuytlQ0HozBaE7E8BfaRc2n3wrtd0pzwBt0xPFsIW7SitbL
	 WPbelH/oKM5SXIxucoBd2TnU5cmH+gtRROZb9u2S17OftXZ2lSCB3NcyW/Y1j+Azzd
	 znZkUDPxd0rGpYmnDZS01kh1tkT46EgGxlU0Hh1xab3O0K1T+UC/84UxQG9QgWpJNk
	 VeB6Aolbb49dNvRCy0englDRK2N7baU5JSKSBk+PcMBje5VFlsbY9F8VW+unVTRuXL
	 fEAoYYMIJQnfw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51ca95db667so1506467e87.0
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Apr 2024 12:21:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YyNRgTt/t9Vm2fSuR2sJFNqe/quQ6N/WrwhBSYwx3hoPZ5EO8TV
	7Cc16T83cdx8O4xSIu58o99A7ZWQ2ORUTNwsNNXeeN31hS+ZIMEEgw52nJ6Vg0rhyPbvvx2AfIz
	Nbunh4rUn3jfEl+qUd8eVTaqEui8=
X-Google-Smtp-Source: AGHT+IGRyLdcMdDI0QYRqTQWVHCjC0zz8lM2ynkj9pvK0uKvvEtRArk+q5nRA8aoAe8/1G5ShdsGDdkHajJ5L5FmVQk=
X-Received: by 2002:a05:6512:ac1:b0:51c:cc1b:a8f6 with SMTP id
 n1-20020a0565120ac100b0051ccc1ba8f6mr2169237lfu.20.1714159301453; Fri, 26 Apr
 2024 12:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240407072933.3562124-1-ppandit@redhat.com> <CAK7LNASZR=n+T=9Lo-5=Nw9WTwY9ywdTNvAUdt8xDXxsnNu3Tg@mail.gmail.com>
 <668901914.114470.1713335369416@mail.yahoo.com> <CAK7LNAReoYHT0-SUzFT11y=pN6GTLSgu0+7Su+2Tthkz5VFymw@mail.gmail.com>
 <1927988181.1604457.1713852967808@mail.yahoo.com> <CAK7LNAShU0GS4e=wRupgwUDHhxMR5SVmkWn4mTZMU6r+Vng0Xg@mail.gmail.com>
 <978513013.1900588.1713936355848@mail.yahoo.com>
In-Reply-To: <978513013.1900588.1713936355848@mail.yahoo.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 27 Apr 2024 04:21:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNARB1WuL=yduv+XjkjCCagrgWQUaKEVk82wn0+QRgoNVTA@mail.gmail.com>
Message-ID: <CAK7LNARB1WuL=yduv+XjkjCCagrgWQUaKEVk82wn0+QRgoNVTA@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: add config and source entry details
To: Prasad Pandit <pj.pandit@yahoo.in>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000409ce6061704d0a0"

--000000000000409ce6061704d0a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 2:27=E2=80=AFPM Prasad Pandit <pjp@fedoraproject.or=
g> wrote:
>
> Hi,
>
> On Tuesday, 23 April, 2024 at 03:41:35 pm IST, Masahiro Yamada <masahiroy=
@kernel.org> wrote:
> >EOL is a statement separator.
>
> * Right. So are semi-colon (;), braces (}{) and colon (:) in case of C an=
d Python.
>
> =3D=3D=3D
> $ cat t.c
>
> #include <stdio.h>
>
> int main (void)
> { printf("Hello, world!\n");$
> $
> $ cc -xc -o t t.c
> t.c: In function =E2=80=98main=E2=80=99:
> t.c:6:1: error: expected declaration or statement at end of input
>     6 | { printf("Hello, world!\n");
>       | ^



It is because the missing closing brace
is a grammatical error.



> ---
>
> $ cat t.py
> #!/usr/bin/python
>
> if (x =3D=3D 10)$
> $
> $ python t.py
>   File "/tmp/im/t.py", line 3
>     if (x =3D=3D 10)
>                 ^
> SyntaxError: expected ':'
> =3D=3D=3D
>
> * In above examples, files terminate without completing the statement and=
/or function definition (missing closing brace '}'), which is being treated=
 as an error.



Again, this is wrong Python code. That's why.





>
>
> >Could you give me an example programming language
> >that errors out when \n is missing at the end of the
> >source file?
>
> * It is not about '\n' at the end of file, but '\n' at the end of the Kco=
nfig statement/record. Because Kconfig language uses EOL as a separator.
>
>
> > I do not think requiring EOL at the end of file would help simplify the=
 lexer/parser.
>
> * It does, because on the parser side you don't have to define rule(s) wi=
th EOF to parse statements.


Do you see any grammar that treats T_EOF in
scripts/kconfig/parser.y ?
It only handles T_EOL.

The parser is already simplified.



>
> >When the lexer is encountered with EOF, it must
> >tell the parser to finish the current statement
> >and go back to the previous source file.
> >So, EOF implies the end of the statement anyway.
>
> * No, EOF does not imply end of a statement. The errors reported by gcc(1=
) and Python above clearly confirm that EOF is not end of statement.



In Python, a newline (and also a semicolon)
separates two statements, but it does not mean
it is required at the end of file.


If EOF is encountered, the statement ends.




I attached two Python scripts for you.

test.py and test2.py are almost the same.

Only the difference is that
test2.py lacks a new line at the end of file.



masahiro@zoe:/tmp$ cat test.py
#!/usr/bin/python
print("A")
print("B")
masahiro@zoe:/tmp$ cat test2.py
#!/usr/bin/python
print("A")
print("B")masahiro@zoe:/tmp$



masahiro@zoe:/tmp$ ./test.py
A
B
masahiro@zoe:/tmp$ chmod +x test2.py
masahiro@zoe:/tmp$ ./test2.py
A
B



As I said, it is a linter's job (e.g. pylint)
to check the missing newline at the end.




>
> * In their case colon(':') or brace ('}') are the required terminators, w=
hereas in Kconfig's case EOL ('\n') is the required terminator.
>
> * Because Kconfig language uses EOL ('\n') as statement separator/termina=
tor, IMHO it should display an error when that condition is not met, becaus=
e such statement remains incomplete.
>
>
> Thank you.







--=20
Best Regards
Masahiro Yamada

--000000000000409ce6061704d0a0
Content-Type: text/x-python; charset="US-ASCII"; name="test.py"
Content-Disposition: attachment; filename="test.py"
Content-Transfer-Encoding: base64
Content-ID: <f_lvh234ga0>
X-Attachment-Id: f_lvh234ga0

IyEvdXNyL2Jpbi9weXRob24KcHJpbnQoIkEiKQpwcmludCgiQiIpCg==
--000000000000409ce6061704d0a0
Content-Type: text/x-python; charset="US-ASCII"; name="test2.py"
Content-Disposition: attachment; filename="test2.py"
Content-Transfer-Encoding: base64
Content-ID: <f_lvh234gf1>
X-Attachment-Id: f_lvh234gf1

IyEvdXNyL2Jpbi9weXRob24KcHJpbnQoIkEiKQpwcmludCgiQiIp
--000000000000409ce6061704d0a0--

