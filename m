Return-Path: <linux-kbuild+bounces-1991-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84C8FC314
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 07:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0989D1C211DD
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 05:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABF417E46B;
	Wed,  5 Jun 2024 05:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k53yFHLD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ED017E463
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 05:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717566356; cv=none; b=jbuOwpurZqhEm1SVG7HePvq+h/KCZfdUKq1p+aU/swmdlCaeU3Mbs0xciOhY7W8sROiQ+XvEsS5nhK+xbxbH+HnqaEy/Exhoc1kEXhg4DQQu7D0Z2VA3DiBLV7kyvkZk00KfOM4zZR9GLR4aDIsbalWBVBIcyTI0K4jcebXXovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717566356; c=relaxed/simple;
	bh=ZVPd4xOjtEUdylE7OWPZktSUUWTFrfJ4cXwGpdjQFv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6RNr+vhUmVOxvf8mZzeDraLMERbC49MIeH17gEjvspfN7PmMCh56LcQ57ACfQ7r9aaWqzbW++zH4DPRjhVQlStL6aw5uca2SzweKv/6IqreR0c64TflomtEL2e3yQBKD0YcDsWoVODf+ssUic6xfC6CEv3r4mQhcrnHrjfpUcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k53yFHLD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205DCC32782
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Jun 2024 05:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717566356;
	bh=ZVPd4xOjtEUdylE7OWPZktSUUWTFrfJ4cXwGpdjQFv8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k53yFHLD7SipK8lDOzqhP+MM5lfoYVLs443brVDp3Q+y+GEaIybFD2XLhiqRpLiuu
	 thjFjcPwRm5U+7oy9fu2uPjgBCmwNvg3zBoXN1gfD8XHo7wRuyjZN1ICMQcLy69VVr
	 eXVB0XaOAOhnqPwekohK+5F43JVay6ZFsL8oOaE1eM3nGiodmzC0bQAXFX34Qq+it9
	 +Edk3YNJsw7sF5Hq0N+to79yfILKaixrngqUaOBSz31z0Rkvfhz80Hswggb+xGhOOn
	 ybPnON/I7Uz5ZwbDwWWqdg0EZYovzLCvkUZxiEBYGHFm1Og0V7xtxltSij4C5nsTkE
	 bVsdQwmLsBiIg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaa80cb4d3so61900581fa.1
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jun 2024 22:45:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZa3taWRXAuDGEyJi3XzsIWioqj16RzzfQJqcXncH0ZNcJFGlfLHM9SXZloN/PBiwgUGQ/V1KJ8YSpJDRpKYftpf7WLxgxrFFMb/KV
X-Gm-Message-State: AOJu0YzSER31ctY7wokH9BJMK+QPqsZFzxVCMmQ5XTMPj+GpW3V4gVLg
	7ibNfFCg5KO+iun/+mXLptThY/AfbQlrGb3VdY7j3cuHyjj8ukjqns34nczxZhOGc1jkA7sjYOZ
	FzfiYI4DwopFvPLk+ond2t4Jxn0A=
X-Google-Smtp-Source: AGHT+IG+A0EQIlDC+rkrNb5l0nSVDHZbodXnFO3zUwFiFTkpMFd12rItz85ZW1ERTlRGcxYkiaBAYOjm7IBOZGDUns4=
X-Received: by 2002:a2e:93c7:0:b0:2ea:8f93:a49e with SMTP id
 38308e7fff4ca-2eac7a68282mr8873951fa.36.1717566354733; Tue, 04 Jun 2024
 22:45:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605034903.373617-2-mailingradian@gmail.com>
In-Reply-To: <20240605034903.373617-2-mailingradian@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 5 Jun 2024 14:45:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASx_iSWZ14W5dpTOM87kB8A-Paq8fM_3nKH5tdfJQ7+ZQ@mail.gmail.com>
Message-ID: <CAK7LNASx_iSWZ14W5dpTOM87kB8A-Paq8fM_3nKH5tdfJQ7+ZQ@mail.gmail.com>
Subject: Re: [PATCH -next] kbuild: explicitly run mksysmap as sed script from link-vmlinux.sh
To: Richard Acayan <mailingradian@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Kent Overstreet <kent.overstreet@linux.dev>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 12:49=E2=80=AFPM Richard Acayan <mailingradian@gmail=
.com> wrote:
>
> In commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed
> script"), the mksysmap script was transformed into a sed script,
> made directly executable with "#!/bin/sed -f". Apparently, the path to
> sed is different on NixOS, fixed by using the env command.
>
> To accommodate the number of arguments above the normal maximum for
> hashbangs, the -S flag of env was used (as in
> "#!/usr/bin/env -S sed -f"). However, env -S is a GNU extension.
> Explicitly use sed instead of relying on the executable shebang to keep
> compatibility with build environments using Busybox.
>
> Fixes: 973eca8db557 ("kbuild: mksysmap now works on nixos")


There is no 973eca8db557 in my tree.

I do not even see it in ML.

Where did it come from, and where will it go?




commit 973eca8db5570dd0c3f2b3190867138cc446eb3b
Author:     Kent Overstreet <kent.overstreet@linux.dev>
AuthorDate: Sun Jun 2 23:13:35 2024 -0400
Commit:     Kent Overstreet <kent.overstreet@linux.dev>
CommitDate: Sun Jun 2 23:23:47 2024 -0400

    kbuild: mksysmap now works on nixos

    Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>

diff --git a/scripts/mksysmap b/scripts/mksysmap
index c12723a04655..835cccf8e7de 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -1,4 +1,4 @@
-#!/bin/sed -f
+#!/usr/bin/env -S sed -f
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # sed script to filter out symbols that are not needed for System.map,









--=20
Best Regards
Masahiro Yamada

