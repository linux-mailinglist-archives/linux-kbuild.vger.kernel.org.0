Return-Path: <linux-kbuild+bounces-5429-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 227F7A09888
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 18:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED33B188E278
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 17:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B841213E8A;
	Fri, 10 Jan 2025 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRYuRwmi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5362A212B1D;
	Fri, 10 Jan 2025 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530185; cv=none; b=d1teGHR/g4khWzCLGt2uQIqA4KxPki/BAGjLBT5FzcjJshvrdWzQsu93vAXfmbzSYQ3bfpiIPWqxZ4rBaEEjykDoTnbAQYAGlmub46rdgeYxqI+sGKCPedR79YFHdr+4xtTnbOchjbqdorpfLx1OitbmMF8J6EmrSBEtR2THFng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530185; c=relaxed/simple;
	bh=Ae1O09Tv0IXmgefWrv4ogZDcDzhB4ONNd0ARygE/wQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3i8wCFulyjUCVo88sOWYaNWyw1U9pddYcfi4S6K51fC6tflrDJNREizoGjMHx6i1n4gvKtlDVY9Ng26UFpeZfqp1VrlupuQtzevChOk9ggpySOaVPLcxLPfjVjRA8wdIStY7um4gfU5RHmTaincJCxZbDrbsBX01C16VsTpWY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRYuRwmi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB688C4CEE0;
	Fri, 10 Jan 2025 17:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736530185;
	bh=Ae1O09Tv0IXmgefWrv4ogZDcDzhB4ONNd0ARygE/wQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sRYuRwmi/6IUBngEt7rdm9dUMVl1AfmAP9PNbTXSpSsJy+zkyqwoN+trwAqxvtHuX
	 q+2DtXwob8vqNuXNG19G0Nr/tZB+Ae59HV6HLVOZ3iAeEIrQ+TOlLu3rV+6fNkBQMQ
	 r7inU58MT5X9s4fAt/RWLzMu48LTaCj1cE9aB2/MD2NWc241FZlQBHlNUin4ir5929
	 Vix/goxkzk0abR6uD3l1xN/KJOMMorLWUfr2C/z1Z0yEMNmtKcdiOSij7sbgl6/7xp
	 z/Ci1U6OeFVMBGQPQH4ZpZZM10H6ucS8ktOHaV2cA/1kkLjLvL981BGvrWRyt+h+ze
	 qElRt6njr8Vug==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so2301213e87.0;
        Fri, 10 Jan 2025 09:29:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVSux5fmwdFSNZGvuxbqW90CaoOXwjXN0sj8I0F4uVvKG/rdy1iID1FOZYySreJAolhuyvMiznZ/14X2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5LJ0q2W9x6B2Rd2Md8FpRbQp46PRkie0KxDq9DYe8F669tc5Y
	IbeYGfcwFAs8FtpoxGQoPy/xCn1qoSdytJJenaKwAvFNm9szfnIYmSnVJXtiy5PyDvmGwLIUU6P
	Yi9Rjxsg0RYBiBbcq2vdDoLN4dgc=
X-Google-Smtp-Source: AGHT+IHmOtS70ir9Lh95V16PvwV2Dsze3CHjvxGuKiBdUUuI1mkqvsd0XYLyE6qo3QuE7tLYnjDkfnnPrZIrjgSzGB4=
X-Received: by 2002:a05:6512:3a83:b0:53d:f177:51c2 with SMTP id
 2adb3069b0e04-542845b1879mr3847273e87.11.1736530183632; Fri, 10 Jan 2025
 09:29:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5843611.DvuYhMxLoT@devpool47.emlix.com> <2207289.irdbgypaU6@devpool47.emlix.com>
In-Reply-To: <2207289.irdbgypaU6@devpool47.emlix.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 02:29:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQq29ws6+vNUzqfUr867q8h4EbWzx6SQgHB0YzaZ2LcEw@mail.gmail.com>
X-Gm-Features: AbW1kvZbPgf69qjQd-zw1l5krcpkeHczEMBhZDGHyJxUJd2-ocUkSeU5SeEKlvw
Message-ID: <CAK7LNAQq29ws6+vNUzqfUr867q8h4EbWzx6SQgHB0YzaZ2LcEw@mail.gmail.com>
Subject: Re: [PATCH 3/4] kconfig: qconf: remove overloaded constructor
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 4:23=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
>
> No extra implementation is needed for this variant, provide a default arg=
ument
> to the matching sibling instead.


I am not sure if this is equivalent conversion
because you are changing goParent(true)
into goParent(false).




> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---
>  scripts/kconfig/qconf.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> index 62ab3286d04f..1c90fec4c2da 100644
> --- a/scripts/kconfig/qconf.h
> +++ b/scripts/kconfig/qconf.h
> @@ -114,7 +114,7 @@ public slots:
>  class ConfigItem : public QTreeWidgetItem {
>         typedef class QTreeWidgetItem Parent;
>  public:
> -       ConfigItem(ConfigList *parent, ConfigItem *after, struct menu *m)
> +       ConfigItem(ConfigList *parent, ConfigItem *after, struct menu *m =
=3D nullptr)
>         : Parent(parent, after), nextItem(0), menu(m), goParent(false)
>         {
>                 init();
> @@ -124,11 +124,6 @@ class ConfigItem : public QTreeWidgetItem {
>         {
>                 init();
>         }
> -       ConfigItem(ConfigList *parent, ConfigItem *after)
> -       : Parent(parent, after), nextItem(0), menu(0), goParent(true)
> -       {
> -               init();
> -       }
>         ~ConfigItem(void);
>         void init(void);
>         void updateMenu(void);
> --
> 2.47.1
>
>
> --
> Rolf Eike Beer
>
> emlix GmbH
> Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
> Phone +49 (0)551 30664-0, e-mail info@emlix.com
> District Court of G=C3=B6ttingen, Registry Number HR B 3160
> Managing Directors: Heike Jordan, Dr. Uwe Kracke
> VAT ID No. DE 205 198 055
> Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
> Office Bonn: Bachstr. 6, 53115 Bonn, Germany
> http://www.emlix.com
>
> emlix - your embedded Linux partner
>
>


--=20
Best Regards
Masahiro Yamada

