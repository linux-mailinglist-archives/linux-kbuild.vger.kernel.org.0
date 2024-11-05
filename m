Return-Path: <linux-kbuild+bounces-4519-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F75C9BD98A
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 00:16:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F384BB224F4
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2024 23:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D71216A2E;
	Tue,  5 Nov 2024 23:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goSMddAX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D67216A2B;
	Tue,  5 Nov 2024 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730848559; cv=none; b=Fm6qAt/dS5evOayYxWt58/+csCyQ43bplcS4gyyMYPl973jDbbUjNLvMVVhBpwQGwp7YGI3joaaW6aB+5D/V7sWqFmFd2n0xUTm96LNf1noxaar0dDc3R0c7CES4RJvys9muRRCxVaKODG+UXOkuZ0fiLZvKGp+lIbPUFvB6L5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730848559; c=relaxed/simple;
	bh=RThAlwCnNZhm19Q+LPedpbwOL2sjptP55DVrXzp9Px0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UKoZbZnBBJL8RghfvPd8306gnZuAkEap0xvVKskVBSY5T5ZnoDc+2jvGFio1exIiQlfmz54p6HOv9oV6vzoy4tdtB0cSqg4PI0FJoqny5uKiuNPPQHAieBIKQko9b9dFcj7Rn4arkD8ZuMe46h6ZxDL1l5TZSAFBuALF7+UmpFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goSMddAX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793CCC4AF09;
	Tue,  5 Nov 2024 23:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730848558;
	bh=RThAlwCnNZhm19Q+LPedpbwOL2sjptP55DVrXzp9Px0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=goSMddAXxrArZqKxsWsnOhOkBhjeSUEqfhfeOcMSJkyKG0uElLUZ2b4CzXMxoXy4c
	 5kOTsQG6frT3wA9iwg8vjENduGb3nqfWrdASlmmNZlp8VelsEj46q2cQkHdQ5htLOz
	 yykYZDSmZxfOmUp/QlIWi7XLHl4jp2fFYuVMhostcpYUMPbQ3YgHV5qLLZoAvYc2L7
	 hWet0dLcY2h6eoTIIC0jaqKA6s+hamFJbRbAgqHb8ZkSOXxUN/d7PiMp/o9q/esBMR
	 VuBakUIohr2bjJnxAj8P58Ad+ZcnbDM5Z+k1NAufydfqtEND7U7HPcTl+BUT9WwfNM
	 Mz8qJCgUW45RQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb51f39394so51230941fa.2;
        Tue, 05 Nov 2024 15:15:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVZgV0srQ87+rn82+c+qwB273qZf2IaRtsTSVjjoEYFtfo43L4/KUizqfC7skFz9Elg7Bap38chDqMjl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj8Uv5tlcWuJ/DaPOfapLn0S+dNIsJ3W/Grx7Uil6RrjSSj8X+
	BUvxr/OXx/wkVvXDGX0m4e39cUnjTTbH7a1P7/PEsTuewSFF2J+PlavK9vRjzzAf3vTSFrs6Cdb
	+7Nzby2KE6KBkVD92UA/frzjGJgc=
X-Google-Smtp-Source: AGHT+IEkekRoeYS6OZwFWk4ykpcd+22QtQtGnpCpA05hQRXGIuQWAjuZGvLPXWI9Xjb1PG3y/UUn1CHJjkw4Rh2wILk=
X-Received: by 2002:a05:651c:1541:b0:2fb:5bb8:7c23 with SMTP id
 38308e7fff4ca-2fcbe005e2dmr184001621fa.26.1730848557184; Tue, 05 Nov 2024
 15:15:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141345.5680-1-david.hunter.linux@gmail.com> <20241014141345.5680-5-david.hunter.linux@gmail.com>
In-Reply-To: <20241014141345.5680-5-david.hunter.linux@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Nov 2024 08:15:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7Gmprpw+AxiZpFcrpzw_Y6ANEw3P43N3pEVFLH=yV1g@mail.gmail.com>
Message-ID: <CAK7LNAS7Gmprpw+AxiZpFcrpzw_Y6ANEw3P43N3pEVFLH=yV1g@mail.gmail.com>
Subject: Re: [PATCH v1 4/7] streamline_config.pl: include tool to learn about
 a config option
To: David Hunter <david.hunter.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	shuah@kernel.org, javier.carrasco.cruz@gmail.com, 
	Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 11:14=E2=80=AFPM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> Include a debugging tool that can help developers find out about a
> particular config option.
>
> It can be challenging to find out what is going on behind the scenes of
> the script due to the vast amount of config options and the ways the
> config options interact with each other.
>
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---

This is not suitable for upstream.

Indeed, this tool is broken, and hard to figure out
what is happening, but you can add print-debug
when needed.


>  scripts/kconfig/streamline_config.pl | 49 ++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/strea=
mline_config.pl
> index f5a07b3a1922..bbcd5a6e9726 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -713,4 +713,53 @@ foreach my $module (keys(%modules)) {
>      }
>  }
>
> +# the following tool can be used to check a particular config option.
> +# You can read the output if the variable "debugprint" is set to "1."
> +# Here is a sample way to use the tool:
> +# dprintvar("INET_ESP");
> +#
> +sub dprintvar {
> +    if ($debugprint) {
> +       my $dconfig =3D $_[0];
> +       my $fconfig =3D "CONFIG_$dconfig";
> +       my $con_found =3D "";
> +       my $dep_found =3D "";
> +       my $def_found =3D "";
> +       my $sel_found =3D "";
> +       my $prom_found =3D "";
> +       my $ori_found =3D "";
> +       my $proc_found =3D "";
> +
> +        if (defined($configs{$fconfig})) {
> +            $con_found =3D $configs{$fconfig};
> +        }
> +        if (defined($depends{$dconfig})) {
> +            $dep_found =3D $depends{$dconfig};
> +        }
> +        if (defined($defaults{$dconfig})) {
> +            $def_found =3D $defaults{$dconfig};
> +        }
> +        if (defined($selects{$dconfig})) {
> +            $sel_found =3D $selects{$dconfig};
> +        }
> +        if (defined($prompts{$dconfig})) {
> +            $prom_found =3D $prompts{$dconfig};
> +        }
> +        if (defined($orig_configs{$fconfig})) {
> +            $ori_found =3D $orig_configs{$fconfig};
> +        }
> +        if (defined($process_selects{$dconfig})) {
> +            $proc_found =3D $process_selects{$dconfig};
> +        }
> +
> +        dprint "config: $dconfig\n";
> +        dprint "config found: $con_found\n";
> +        dprint "depends: $dep_found\n";
> +        dprint "defaults: $def_found\n";
> +        dprint "selects: $sel_found\n";
> +        dprint "prompts: $prom_found\n";
> +        dprint "in original config: $ori_found\n";
> +       dprint "process selected: $proc_found\n";
> +    }
> +}
>  # vim: softtabstop=3D4
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

