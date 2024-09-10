Return-Path: <linux-kbuild+bounces-3492-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B191972DFA
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 11:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCD44286E91
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 09:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7427218B482;
	Tue, 10 Sep 2024 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lN681ZaB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FEA188CDC;
	Tue, 10 Sep 2024 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725961092; cv=none; b=djkoIoJh9RVOR3gQTwvUViUvAOIz3OTM0DD1E2uhXc1Ev15oZW7TLHAGx/MkyYwD3VtBgP+r2bZauoDUt87uq+nr+vlE8VkKR/rfp1lOYBCBTZeAe4ucftmzvV8Qf+h1Jo+NnWObx/QUD2p4RhfdXVD5c8thhH1Y+rPi6BMU1DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725961092; c=relaxed/simple;
	bh=pQXXDMRKxnsBDSo1gqJg8KYyJqDJVN2Nygl8s9ku040=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xu3pqTN/isnT/R1MhDr7gW5pIK4T+Y2FBp++xhGBwxM9h+loOaCztjyOSl0fysvFy6NOvyPaTl9ae4cJ89ZWcrNOEDXspADGCpGPzM+lMWraYMAZEi/YSKTEYqgTF7JnaP8R5Fy/YK+vgWSddH5w+rUau6NPCi/fWod8+YCTxWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lN681ZaB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D908C4CECF;
	Tue, 10 Sep 2024 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725961092;
	bh=pQXXDMRKxnsBDSo1gqJg8KYyJqDJVN2Nygl8s9ku040=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lN681ZaBw6958lzQ2AsJbCM+JwMMUUB8JxoVGL1KLnd2lC9J9/dj3uBhzwaxMWUEg
	 7wtHa4mNa6bIOL5oglNvvGMIV5rwwcM02vu6EbcFt4NEMQZBpeq9e3YGPNraRrX4hr
	 I394TZTwul7MABM44p+pT5lPSQW20gGrJv3k9N88TtgaqeNn9hTjrtJLoA5Rm0t/ra
	 kKPS1vWqqsDkOuD4eUrHEmEzLIRnVqhiCAPdpUC8U+ri8Gp41LPkyOO67gsBK2bEfy
	 46C1ntsHYfStvEQGAdPVEQCGjybad37rCKKL9PGBgmcGxmRJusMajnHQUdDrtxXMze
	 pwzYZ4AZpSoZw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f7529203ddso37609861fa.0;
        Tue, 10 Sep 2024 02:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTIzawbxxtFJTdqgZZQyS8CMwthr6inJDMn1uOGc5a43wURzFBS1LtK2Bp2nuVeYc3VlAzKfaWc0WfcZ0=@vger.kernel.org, AJvYcCVd+TPH9wlRUklBEQW48F3ksMWl/VSuGRFAndCRcZHE3XtuT+cTYDmwoHDMKrPGD2oxYYn79ERrnG1YTxrLBK1+vBQE@vger.kernel.org, AJvYcCVjKwVJSngtgsfkqqpFw4niadKPerlZp19e/DFda0bBe1SUDMyHcVb7tDpkOBNoiL2+jRoVb9IvkZtKxjIjtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeq4vp4uW6/4GOmoinCa1u1jlK1yt6A3WDhGQVKC32tyRf6THp
	hOY8iSDGeo0MhzYlG5WsOyvo+UBLQOqhnrsHNJHPBmYsS5l1RcuauMbsq01NeLgMgR4nurTuAIu
	jBUD1E+0E1SDui+GDQPoTJnDdEwI=
X-Google-Smtp-Source: AGHT+IE1GfQO22vq58NMlD81uHWYcsg0j7WpA9waYrdJSm6XZhf3An7rootcx2E7Qk8EDCQK8ZS9GXc9tPVSIcfYLLs=
X-Received: by 2002:a05:6512:3051:b0:52f:441:bdd6 with SMTP id
 2adb3069b0e04-5366b7d4cdcmr792239e87.0.1725961090734; Tue, 10 Sep 2024
 02:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
In-Reply-To: <20240906144506.1151789-1-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 Sep 2024 18:37:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT0R7YxhtPbK-W1+Witxn2xNYFY4RJpCj7u=WhyafyMuw@mail.gmail.com>
Message-ID: <CAK7LNAT0R7YxhtPbK-W1+Witxn2xNYFY4RJpCj7u=WhyafyMuw@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] Generate address range data for built-in modules
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 11:45=E2=80=AFPM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> At build time, create the file modules.builtin.ranges that will hold
> address range data of the built-in modules that can be used by tracers.
>
> Especially for tracing applications, it is convenient to be able to
> refer to a symbol using a <module name, symbol name> pair and to be able
> to translate an address into a <nodule mname, symbol name> pair.  But
> that does not work if the module is built into the kernel because the
> object files that comprise the built-in module implementation are simply
> linked into the kernel image along with all other kernel object files.
>
> This is especially visible when providing tracing scripts for support
> purposes, where the developer of the script targets a particular kernel
> version, but does not have control over whether the target system has
> a particular module as loadable module or built-in module.  When tracing
> symbols within a module, referring them by <module name, symbol name>
> pairs is both convenient and aids symbol lookup.  But that naming will
> not work if the module name information is lost if the module is built
> into the kernel on the target system.
>
> Earlier work addressing this loss of information for built-in modules
> involved adding module name information to the kallsyms data, but that
> required more invasive code in the kernel proper.  This work never did
> get merged into the kernel tree.
>
> All that is really needed is knowing whether a given address belongs to
> a particular module (or multiple modules if they share an object file).
> Or in other words, whether that address falls within an address range
> that is associated with one or more modules.
>
> Objects can be identified as belonging to a particular module (or
> modules) based on defines that are passed as flags to their respective
> compilation commands.  The data found in modules.builtin is used to
> determine what modules are built into the kernel proper.  Then,
> vmlinux.o.map and vmlinux.map can be parsed in a single pass to generate
> a modules.buitin.ranges file with offset range information (relative to
> the base address of the associated section) for built-in modules.  This
> file gets installed along with the other modules.builtin.* files.
>
> The impact on the kernel build is minimal because everything is done
> using a single-pass AWK script.  The generated data size is minimal as
> well, (depending on the exact kernel configuration) usually in the range
> of 500-700 lines, with a file size of 20-40KB (if all modules are built
> in, the file contains about 8000 lines, with a file size of about 285KB).
>
> Changes since v9:
>  - Reverted support for optional 4th arg to generator script.
>  - Reverted support for optional 6th arg to verifier script.
>  - Added modules.builtin.ranges ad vmlinux.o.map to CLEAN_FILES.
>  - Fixed support for sparc64.
>  - Fixed support for LLVM's lld linker map format.
>  - Updated error message when .*.cmd.o cannot be read by verifier script.
>  - Added syntax output for verifier script when not enough args are given=
.
>  - Return 1 from verifier if verification fails.


Applied to linux-kbuild.
Thanks!

--=20
Best Regards
Masahiro Yamada

