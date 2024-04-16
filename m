Return-Path: <linux-kbuild+bounces-1584-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C848A69EA
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Apr 2024 13:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 811E21C20E97
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Apr 2024 11:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CEE129A93;
	Tue, 16 Apr 2024 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMtV0qWn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D232A129A8D
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Apr 2024 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713268171; cv=none; b=hkP0ob0eWVYgEjZADfGjWgdFjrLos1MwEvnQqLgIKSht9WmWyaQr0LggS2YzyMaxDQPlvXHQW9gYzvr79W8OCs1FM4OssDEMgkCAy41s+9nFcVKaE6U4U0Ft5+QBzw1nkR4/ie95RAQT8Uv3d4SGta+RD4FHj5OMz9MwqVpKY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713268171; c=relaxed/simple;
	bh=pcKNHRrpQZPMbx0HFnLil3MqTWj8T/tSct0jjAPRjVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guAb9ef2ZkdUDbemg4oINKCs2V1Gj7gCimxfVLkujv88zC4UJ6B9QgJjm5ymZOnO2EKx0VL/0y1H2TqOD7irUdIMuHk93XrxHRe3mUEru6H2uQowVbj/EpS5OjCjIQS3vqqGYOrgSZOwezS3HQ9/u51ZJCIMrqIOQR+UkbyQEic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMtV0qWn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62285C2BD11
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Apr 2024 11:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713268171;
	bh=pcKNHRrpQZPMbx0HFnLil3MqTWj8T/tSct0jjAPRjVk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AMtV0qWnySazbzcIyDo3Ab3UOlNESd4m7VuSL8q3hOejV43m4oVQ1QYAiOK7WNV0Q
	 mivRhRncAKUerehN/2z6MZkCnPlN9EBoBY86LvkF0rUEjbNS9/Y9keVno+e5h2PDat
	 cDYsRFLoeikY2ntyHrjxY+oj+OarxyaosP+QKGKDNPVHMLE91ihhYtOdn+9zKWKs1R
	 jQZqE19jdDL/giwOXg1+PziCt5PAWg+s2C0O8hE9cvMfC1/RM0TL0GXT/Nyl3t+KBR
	 C3MZciPH/Llw2t8vU12UX9YoGpxeH/NC9TZyFRhm1MlWSVaSNJsYPbR+V7Db/x39qs
	 sl0DYvXbg1OiA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d895e2c6efso54651681fa.0
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Apr 2024 04:49:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YxSMfhtSQzuwbsw5LBNrXsFtWS591AcaMR9SbJimZ6GucOA/fvw
	C9NgOqgnwPOcpZw5sMowleyqS7mZS91jEU7hfdgDiaHp+eZgLse417gq2ik/baiONWb3QyrDIfJ
	Hq1IL2UAOr32w9thAUn8dsmNNeIc=
X-Google-Smtp-Source: AGHT+IG9BlnHY224mJ+eloBugf/P/2GoeS9MGuDUt/8sQ33HDtOgKkVweuHvy0BzNVxLRktoauDO7bO3qx4ssY/FRLQ=
X-Received: by 2002:a2e:804a:0:b0:2d4:6f14:53d5 with SMTP id
 p10-20020a2e804a000000b002d46f1453d5mr7591673ljg.26.1713268170039; Tue, 16
 Apr 2024 04:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240407072933.3562124-1-ppandit@redhat.com>
In-Reply-To: <20240407072933.3562124-1-ppandit@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 16 Apr 2024 20:48:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNASZR=n+T=9Lo-5=Nw9WTwY9ywdTNvAUdt8xDXxsnNu3Tg@mail.gmail.com>
Message-ID: <CAK7LNASZR=n+T=9Lo-5=Nw9WTwY9ywdTNvAUdt8xDXxsnNu3Tg@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: add config and source entry details
To: Prasad Pandit <ppandit@redhat.com>
Cc: linux-kbuild@vger.kernel.org, Prasad Pandit <pjp@fedoraproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 7, 2024 at 4:29=E2=80=AFPM Prasad Pandit <ppandit@redhat.com> w=
rote:
>
> From: Prasad Pandit <pjp@fedoraproject.org>
>
> Add details to the 'config' and 'source' entry description,
> to make it unambiguous. It'd come handy as reference for
> Kconfig language or patch reviews for Kconfig source files.
>
> Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
> ---
>  Documentation/kbuild/kconfig-language.rst | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> v1:
>  - Fix typo path -> patch
>  - https://lore.kernel.org/linux-kbuild/20240404064037.3440433-1-ppandit@=
redhat.com/T/#u
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kb=
uild/kconfig-language.rst
> index 0135905c0aa3..0783850d5a00 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -39,11 +39,14 @@ them. A single configuration option is defined like t=
his::
>           kernel.  ...
>
>  Every line starts with a key word and can be followed by multiple
> -arguments.  "config" starts a new config entry. The following lines
> -define attributes for this config option. Attributes can be the type of
> -the config option, input prompt, dependencies, help text and default
> -values. A config option can be defined multiple times with the same
> -name, but every definition can have only a single input prompt and the
> +arguments.  "config" starts a new config entry. The following lines,
> +indented by a leading tab (\t) character, define attributes for this
> +config option. Attributes can be the type of the config option,
> +input prompt, dependencies, default values and help text. Help text
> +is further indented by two more spaces.


Wrong.

You added

 - indented by a leading tab (\t) character,
 - Help text is further indented by two more spaces.


These are recommended coding styles for readability,
not grammatical requirements.



You can write Kconfig code without indentation,
without blank lines in-between.


config FOO
bool "foo"
depends on BAR
config BAR
bool "bar"
config BAZ
bool "baz"


It is unreadable, but it works fine.



Only the place where the indentation plays an act
is the end of help. It is already documented.

  The end of the help text is determined by
  the indentation level, this means it ends at the first line which has
  a smaller indentation than the first line of the help text.





The kernel coding style is documented
in a different file.



See Documentation/process/coding-style.rst


 10) Kconfig configuration files
 -------------------------------








> +
> +A config option can be defined multiple times with the same name,
> +but every definition can have only a single input prompt and the
>  type must not conflict.
>
>  Menu attributes
> @@ -451,6 +454,11 @@ source::
>         "source" <prompt>
>
>  This reads the specified configuration file. This file is always parsed.
> +The specified file path is from the top source directory ($SRCTREE).


No.

Kconfig searches for the sourced file in the current working directory.
If not found, it searches from $SRCTREE next.




> +It allows one to source a file from any subdirectory under the source
> +tree. Such path is always unique under the source directory.
> +A configuration file must terminate with a new line (\n) character
> +at the end.
>
>  mainmenu::
>
> --
> 2.44.0
>


--
Best Regards
Masahiro Yamada

