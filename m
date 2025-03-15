Return-Path: <linux-kbuild+bounces-6151-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9232A627D2
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 08:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FEF77AC7B3
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 07:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AA71B4234;
	Sat, 15 Mar 2025 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXJzc+lQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90AB19F462;
	Sat, 15 Mar 2025 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742022574; cv=none; b=AIEdXeF+EBieeobbxVnEJ5fRHquQ96kFcn946VSnKeOxm8D0b7F+FYnDlllR/GhZ1l0g6is6zBEkt1m9QolhIIhi7hbsf4xN7uRjIMere1+iNfnIuxSM7daLGPjT3MUbNKH86A5B1dRMU6qVotvQ/oetd3HFM/b2RMgaUEdDlbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742022574; c=relaxed/simple;
	bh=a6Ck8tKwbWwde/1eKtm+QFb48OQ+zqW8lw5oJuXYSao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRmYSGTGiYaHDinRSyDI3JRiDanXgyOhY69dXvEVY5Eh2PbNUgwc0DqPf4d3ycseo3Pn/6AETYF0h7mGBQ3PFj6f6Tbp5lVGvW8MUHTd9ZFvD5FPMRvc8Ijbp5IMj6pEwC2U29nJQg6pp1JoxeTM2uGgAuJNYnaY14/LyA9/Nt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXJzc+lQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E88C4CEEF;
	Sat, 15 Mar 2025 07:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742022574;
	bh=a6Ck8tKwbWwde/1eKtm+QFb48OQ+zqW8lw5oJuXYSao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MXJzc+lQ1xkZTHJty/qJHk/2PCv2Sclve/xnVzSwMZ9o1oJ6aYRIEdxEYu5mgujw4
	 jWYdlifOjvHho/PpbHvP3vM4WLYSHhn0jLQ1TjzI4QMIfPU5ry+/27pkDn5h8G+WDm
	 h4PKdVjRiV2iM/+VC8LvBP/9wp91msqvHiap3S4JcS2AVokEEmfuB95ExGnTbqr8IH
	 b6/c63xgUz6HGOMWNuCGm1Cw+MI4OgpHLUgqFbHXFiz2CasqcR51WnEwTJH3ntnp5b
	 YniPI0OEeX3j6rHWsErGIjsQ4KisigaiB2eKq1cx0gLo+xIMmG1amwgrA69WphPJfP
	 W7I3mYvkAkmUw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-548430564d9so3150090e87.2;
        Sat, 15 Mar 2025 00:09:34 -0700 (PDT)
X-Gm-Message-State: AOJu0YyaAY0582NphnbZuWfjBDT69skUICJCY1153+SV0IlzWMgbLuLC
	wbhs6kpnOKVdf6SozqsqUbCp0YbaoGE/BCOv5ZQFLWRKRYvEMWvC2Ykda7LBDtKRYFMipCdNZu2
	/6YWoxQ08uHn7Iq7WFReOQ1hzE4M=
X-Google-Smtp-Source: AGHT+IF1uZ5HDd3gO6a9UNd+GNTzqch0xvY8JnudizvelLzaXzi51o2713MHej8M+m36xSKdJxbOd/Ms6o6hs//ayCQ=
X-Received: by 2002:a05:6512:1115:b0:545:576:cbd2 with SMTP id
 2adb3069b0e04-549c38eacbdmr1829273e87.10.1742022573132; Sat, 15 Mar 2025
 00:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313102604.1491732-1-masahiroy@kernel.org>
In-Reply-To: <20250313102604.1491732-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Mar 2025 16:08:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqnn=YEvrZsDan5_dGdgv=Db2uQ-_WOhj2bS1AwUc_4w@mail.gmail.com>
X-Gm-Features: AQ5f1Jpghb6OqcuJoJkpWZECgbcrLGWiDDT1FO_dkuyPboMNd3RGUeqhcmFTkQY
Message-ID: <CAK7LNATqnn=YEvrZsDan5_dGdgv=Db2uQ-_WOhj2bS1AwUc_4w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not generate .tmp_vmlinux*.map when CONFIG_VMLINUX_MAP=y
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb+git@google.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 7:26=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Commit 5cc124720461 ("kbuild: add CONFIG_VMLINUX_MAP expert option")
> mentioned that "the .map file can be rather large (several MB), and
> that's a waste of space when one isn't interested in these things."
>
> If that is the case, generating map files for the intermediate
> tmp_vmlinux* files is also a waste of space. It is unlikely that
> anyone would be interested in the .tmp_vmlinux.map* files.

I fixed this typo:

.tmp_vmlinux.map*  -> .tmp_vmlinux*.map


>
> This commit stops passing the -Map=3D option when linking the .tmp_vmlinu=
x*
> intermediates.
>
> I also hard-coded the file name 'vmlinux.map' instead of ${output}.map
> because a later commit will introduce vmlinux.unstripped but I want to
> keep the name of the map file.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Inserted before Ard's patch set.




--=20
Best Regards
Masahiro Yamada

