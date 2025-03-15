Return-Path: <linux-kbuild+bounces-6157-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16530A62924
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 09:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55FB617CCE6
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 08:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B511E7C20;
	Sat, 15 Mar 2025 08:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYoMAtNz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1FD1DF993
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742027984; cv=none; b=cbw8rxE/9JVFIZjuw4J9e78rLuHAPEqD49K+6UmHrBTgpepypNjg5/2gpdZAoWddtaUF2bNhIVr4av3PaNxBfTvZk37ll0uDrVs1AVtieWtvkZZW+GtBQ+XY1YobHizCNni3zN5Ph874JvZyuUDxCP1AT4qo03mpHaARhxnHDYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742027984; c=relaxed/simple;
	bh=5LqvU/cJQx/1TIRoWiOkrdkCMIi9f/CjyroRp+0LRNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrtRKd78vsG+Py4HVy8nduPL+PBrMGD0YlBZM3pp9JA4hi135gUYJOKwMwg1gpSRDcfyj1cGu8GW1wwATVrN3u4JNnrrNKr37ePWBnnGnfAD4XkcA4e6s7STnzyU1TMUGA91Z84ceKuJVFfIQjEtVg474Bdh1CoN0dLo2wwtPl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYoMAtNz; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff611f2ed1so119817a91.0
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 01:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742027982; x=1742632782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zU+utGiUYn/lWu8TMh9PRW1LdrPW+WIyNxx2vVUsNOY=;
        b=mYoMAtNz8qBm7/lpRfeij88F4N1SlaAeF/WrmY5V3sEfD4xLtfPjsSevbeSI7v3zIy
         9IxUwfd16KPcCkC7SebleD+7sxAawW74HL6ZZ+TxEGJVBnGdRFjA1vBq6saqGMarFvpO
         SPZjkLUlt5cVmoQV0caipwDTStMOe1PIpUrk8QZvSkZJySxb39n/ZUQPI/RYYHUoq5/P
         r91jT6iAU3CFBININWP9k240OnASbGW8fFjCuCmlsKsO1wkfF5gehw4IQUHNf3g0/1md
         Ha8fotAb3ses9wDSTyrY/uOHzQxeqG7PbYufYZmhr/6lm0pEA+NuYa5a6jJekeVXbcJv
         nE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742027982; x=1742632782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zU+utGiUYn/lWu8TMh9PRW1LdrPW+WIyNxx2vVUsNOY=;
        b=F3SqG/bQWM26iupWwYbdBXdrgE+IlrE2iuopenmuvyOn/Rd+5J1iwdRnj1ocSo5r2l
         8H+rG2fpJ+ywbWSaWY8RhG5Op6PgJgujb0Vhs7pzNjiVe7kRW6QWSdu8zoOAP9RzGhTN
         hHLTyhSiHT7o/vkiY97los04tWrj5aQT7wfScUq29dzko+tAwZjn8s2VYN4g3kR8oXMI
         qNzsGAQjb5RXoxGF+YZRv5c0Hx8MUsQ2UDKfKUQy7a91G172W0PWQmwSwE4zmys238sT
         49x5T2g8APIHg8r6CS8F7pU9b1ywTSb8N1IIu0MG0SP+FK/rsEWq49tcPGvBK3K91pud
         /wPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNZq83B4hOkRHqnqKKfb7bQtrJi+lI8fjNu7Jjy0GsmwSaDz0isAEZC24pIyGS0qbbTK33uGi7JmU/uoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZTmX5wrPNAjLXbwi7tv8HUi1g7CjQKC08p2aWBiJVX24wOzT
	0uM0w+ZgFFfqYf+tSLOhnx03t+socSbsuSiszq91yfG1/hQ44irF5YIYw6ins9C5gwuJIY0V3+C
	9bbQ5igDHW/yqfYXZK8CDmlzmQ1U=
X-Gm-Gg: ASbGncsb+/b7Bs0N1KEINy60+cqWQbLb26KtOZpx0eRIJ4GpTT9e5gelk5LKwbEZqoH
	hbpqLD9XCj4waHItqWqbpX/bQXfAYWCmY/mgwpsv94AK61XRB7Us22ex+D/CKHMPuSKKMh4v0uk
	wzBUHxE2oJkq3arYxX5EyuDhI9ug==
X-Google-Smtp-Source: AGHT+IEiDB4t+c598d3Rq4swU0Mc2iQEwpq/fpeMERuc6Zu1/Nz/gU10ofBwL1zy26MHqx+aHZR0uleLUhg1IqlQRug=
X-Received: by 2002:a17:90b:3850:b0:2ff:6941:9b6a with SMTP id
 98e67ed59e1d1-30151d40343mr2609242a91.3.1742027982134; Sat, 15 Mar 2025
 01:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z9IsEPOnC+MGSAEA@rli9-mobl> <CAK7LNAQpbQCzKha63SnJG2TpyXCFB4Vu8Q9xua9G8ht=Fbk_kA@mail.gmail.com>
In-Reply-To: <CAK7LNAQpbQCzKha63SnJG2TpyXCFB4Vu8Q9xua9G8ht=Fbk_kA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Mar 2025 09:39:30 +0100
X-Gm-Features: AQ5f1JoLQONECP0PuXiZH1IsoZyMhazVY9AyCX57H_XAEH9AnCNINSRLMFnffeA
Message-ID: <CANiq72md8yWAHdZeJFWAQFxb_9ftTFMiQciK+ZGf+3Lp_Jxa8g@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 15/20] error: Unrecognized option: 'remap-path-prefix'
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: kernel test robot <lkp@intel.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2025 at 8:45=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Do you see this?
>
> I tried to reproduce it on commit
> 6b5747d07138f8109b1a150830f1d138de146ac2,
> but I did not observe the reported error.

This is probably:

    https://lore.kernel.org/rust-for-linux/CANiq72ntZj10H1DBqRyX=3DuLertMw5=
9e=3DPM7ESVJ0zWfu_ECnnA@mail.gmail.com/
    https://lore.kernel.org/rust-for-linux/20250314213333.2230670-1-ojeda@k=
ernel.org/

Cheers,
Miguel

