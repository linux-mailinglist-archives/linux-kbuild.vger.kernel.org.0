Return-Path: <linux-kbuild+bounces-7824-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F22B3AF085B
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 04:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F945188C3DA
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 02:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8E217A2E6;
	Wed,  2 Jul 2025 02:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohn2GpW9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2D13B590
	for <linux-kbuild@vger.kernel.org>; Wed,  2 Jul 2025 02:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422457; cv=none; b=SM4/DsGTD6w+6PpTdL+F/PGhZWt46BH5RdCB1Vpat+W+ZZumyRAkcBHYsG59dMfwNe3/lq7vvuJxvysLeQX2CY4BxZrN9VLdY98icNIM88S0Kap2nrkbiU0Lw8zRYvDsG5OX0amM95Ap+6uGkxTgSYmJKspTY/iNbfAUy1WWZQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422457; c=relaxed/simple;
	bh=DVPn8HWWJUj0asn1/KXcJIY9xl8w65/qe64YXMTTYow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQAxWvrX9kV7edwS9Ah2o5FHXrMduRRmrc7CAGP+t+JGOCQClzJCqMyAVGQi/JDoczjsMY8j4J09YGsf4hWVl5O6haRWVeR1K6qRLYpVs1UINO2r8i0dna0fNO1eqZap/9x2HR/zjg5MZX3L5aF8nKSlAC4/hA3vcOz5d6zAbmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohn2GpW9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBD3C4CEEF
	for <linux-kbuild@vger.kernel.org>; Wed,  2 Jul 2025 02:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751422456;
	bh=DVPn8HWWJUj0asn1/KXcJIY9xl8w65/qe64YXMTTYow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ohn2GpW9nrOzwu1+zmFu9KzRwA6uyizj6udVvVSfr/1xlHJ5YU6gep40VIxax91ND
	 lFyqkiRHk0y/Tc5CVt3LQ+XA2sZzoad812yYq8w2OU1b8Ju6Q7opzS9DP9O1yPUkeF
	 hSlOcVo80QNSI2etiDrR4apTjG3Fh1L+u50nJxUdI1/l2AHenB1jVxBTYiCrOvvn56
	 HTbZbHygFHIBNdSRLLAUPYVEr3JglULrbMdBmub4hDx9ytB1wzgkh2/Iy2i/ngFiKo
	 5vBjJOA5np/vLeq0fYDq1mmvA7aJO7W7lAK4pAbaZ0mTntS6KmUwweIlBF9x5kqNKy
	 nIAzqfYV4VM9A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553b16a0e38so6945789e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jul 2025 19:14:16 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw8dK9kNcI1UjSk5ZLsWZ6J8BpmknCcjKyl+w0wCvJAOwMkPIrE
	FEddKE1mMAHh6bsJVy5+xBj214AA+g5+acU+VB9M6iUGALJDlUlhjJ/EbTma2vQy34/+VbUWhpV
	jOvlKDrUQcl3mg8bSOnA7SOuVfH9q8JU=
X-Google-Smtp-Source: AGHT+IG2QiTuxwwKMQFmlZB8xbfNMJFuNSfRJqKehMXGR2L7kj3D2aso+jmK9/3m9JXG7invcAN5bT9UuSvWH5WEpNM=
X-Received: by 2002:a05:6512:6c5:b0:553:d211:eb7e with SMTP id
 2adb3069b0e04-5562828243amr337558e87.41.1751422455228; Tue, 01 Jul 2025
 19:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701121444.950640-1-masahiroy@kernel.org> <a40c36ff-7f1b-4873-9aa2-b6864710c262@infradead.org>
In-Reply-To: <a40c36ff-7f1b-4873-9aa2-b6864710c262@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 2 Jul 2025 11:13:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ3gJ9+=7iGeM=k2TT2+VGxQ6hEni=+t-rD_6G_dbyBRg@mail.gmail.com>
X-Gm-Features: Ac12FXx1U6QqYFRNbw0J19E-U4_cMZYXyhQvxgVjbwGyj07xpgATkazkfnokE58
Message-ID: <CAK7LNAQ3gJ9+=7iGeM=k2TT2+VGxQ6hEni=+t-rD_6G_dbyBRg@mail.gmail.com>
Subject: Re: [v3 PATCH 0/1] kconfig: improve gconfig
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 2:58=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Hi,
>
> On 7/1/25 5:14 AM, Masahiro Yamada wrote:
> > This replaces just one patch in the previous submission.
> >
> >  "kconfig: gconf: preserve menu selection when switching view mode"
> >
> > There was a corner case where the menu selection was not preserved
> > when switching to Split view.
> >
> > [Test Case]
> >
> > [1] Choose Full view  (default)
> > [2] Select "64-bit kernel"
> > [3] Choose Split view
> >
> > In v2, the selection of "64-bit kernel" was not preserved.
> >
> > This has been fixed in v3. The remaining parts are the same.
> >
> > In case you are interested, I pushed the entire patchset to:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.=
git gconfig-v3
> >
> > The code diff between v2 and v3 is very small, just as follows:
> >
>
> I applied this patch to the gconfig-v2 patches.
> It works for me.
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>
> But I do have one question/annoyance: why does the help/message panel
> always switch back to:
>   Kernel hacking
>
>   There is no help available for this option.
>
> Is Kernel hacking the last entry in some (menu) list?

Good catch.
I do not know why "Kernel hacking" is displayed, but this is a bug.

The following small diff on top of gconfig-v3 will fix the issue.



diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 775f9b5e10f0..520c0542426f 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -53,6 +53,7 @@ enum {
        COL_NUMBER
 };

+static void text_insert_help(struct menu *menu);
 static void display_tree(GtkTreeStore *store, struct menu *menu);
 static void recreate_tree(void);

@@ -92,6 +93,8 @@ static void _select_menu(GtkTreeView *view,
GtkTreeModel *model,

                        selection =3D gtk_tree_view_get_selection(view);
                        gtk_tree_selection_select_iter(selection, &iter);
+
+                       text_insert_help(menu);
                }

                _select_menu(view, model, &iter, match);



I will fix up the code locally.


--
Best Regards
Masahiro Yamada

