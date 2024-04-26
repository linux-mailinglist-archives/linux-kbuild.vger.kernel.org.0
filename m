Return-Path: <linux-kbuild+bounces-1692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E09E48B367D
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Apr 2024 13:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7683FB2187C
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Apr 2024 11:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78821144D3E;
	Fri, 26 Apr 2024 11:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8rA2F0k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31165144D3C;
	Fri, 26 Apr 2024 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714130783; cv=none; b=fiE8x9od7E5DEJ3qjTBn5zU4hvvJwGzt4LGwtGJLzgxLZyyT82fV4esJiCg2I+MmTqZ87DqSTQoCJL+wlaLAy1QB2psZjr6Ve7Yx8lofCndduwvh/g/nHk/dAI91TMEEhYVmyjTyC+u7fuVEbC6Nm7aiyXn0gmyJFnDOnh5jdvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714130783; c=relaxed/simple;
	bh=eAvAWrFgtQ2mFDBBY05se0TP4T0wymaT6lQRQYtN9iM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O44Sx6ec6cSiAQdwvHl32BnJoA2kLM05k8zY6AaxDz+Bpb3UuRyrGy7vxCN2UmMpa4QWPPcoz8IhQfQdHKbMeV5VObxKGp3MSb/idEyRgRPK3GEzY33L0fLl6NGTZEsq8OVqVWyJ2oPGTWn5ptGkELJUfyhsiVytyOpyqRF70fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8rA2F0k; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5d3907ff128so1603270a12.3;
        Fri, 26 Apr 2024 04:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714130781; x=1714735581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAvAWrFgtQ2mFDBBY05se0TP4T0wymaT6lQRQYtN9iM=;
        b=l8rA2F0kR+kwnZUhSmt1eDypphiOcFPTFo3LNGUWF/rFM3DRN2zeB1FSMHaagbXTu0
         jxRM6GbNleQZAc/L9a51V6YBGt2fn2G2LkF/ADVU61qLFWxggmytXUo+M198YfDWYdUe
         t/M5cmdnWDnzjXBK8pGLCpPbgiA08GH4e2GsmGftcXC7gnVeam6rUCDGo9KZaTqW7tnr
         z9XpN4t41GOSPgS4GTlvEaVB/BU9/IahowEdPT6oj6YAGd2KeOfi4e0IePN1eoHqA7Rk
         u82PV85WXtGu32zQ7n3c2OHeJ1f8pen7sz8v6RO4QzFK/H6OmhL5lBftsdfqprDyjz7X
         1ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714130781; x=1714735581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAvAWrFgtQ2mFDBBY05se0TP4T0wymaT6lQRQYtN9iM=;
        b=rnFvW47Nw7heDE1PmPhn0yh1wg0a8Gwmbh5qHefWcxma9w8rUCIxO9ty7G260s3SCJ
         TinBWF/7kHzshNP+ExDcfHv4CPtCS5DDeIQB+fcgN+NkAZ0ojOGgui/PmRJ3gAeFClw3
         AIaQRDxzfLgiIuxbYr1bEhRa7T2cUnpgt0EGYTIURxUOYqj39OQFTKIyI6nJTuwNfDyg
         QqgktDYAAooadjDbuVQOesrM279eH1bdGEuPhKPpsIBQ2gDXQq55enLEpXaRKKSQeQiB
         DYULSbt6SGo1fxNiZkYArMTEyMXdDnfV86rFxfo4sXzCCj4ZENZbKKSEWD39KepP0Nhh
         h/ow==
X-Forwarded-Encrypted: i=1; AJvYcCUwYHIq8Elytf2bbL8FBm/KS5Fvv8Z9OWTTqHlMtfsI97r3fMvINjWhdSW4C+p1GAVIoDPMml8tIhb2jNaqei3en1Rf3EEg1vY4CuN43CI=
X-Gm-Message-State: AOJu0YzcAT1vpfDuLq1FpqmxxSwJnLxn1o2rd7GxuU6TiBDeptiQFvuL
	j1bWZbjzPcjJTLoL0JF7Q6ywP/dAFl+VX9BFK67fmzqVy/eyER08R+4hF14YfXOp6qf/LNdo0PD
	d8PqDikuMlvvycOjWpiFaijuXaWXsr4Z00R4=
X-Google-Smtp-Source: AGHT+IF1aD14GTOBzmDDv5Agsa8peRMfGaM/ZoBYA3pFgL0Y85zBnwguHZYg7B6kmxdTNIcaxeUCJvgWc9lFyJEHm7s=
X-Received: by 2002:a17:90a:7895:b0:2ad:a5d2:8e2d with SMTP id
 x21-20020a17090a789500b002ada5d28e2dmr2757829pjk.14.1714130781430; Fri, 26
 Apr 2024 04:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANcniXsneeNs+Hfr9PScU2aYPyvn6re=5T0Cu5dgAa4N_b7m4A@mail.gmail.com>
In-Reply-To: <CANcniXsneeNs+Hfr9PScU2aYPyvn6re=5T0Cu5dgAa4N_b7m4A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Apr 2024 13:25:15 +0200
Message-ID: <CANiq72mzHj+4pB4F5FbuyKVP7o751LxHosNeEu4UhHyWqwOmdg@mail.gmail.com>
Subject: Re: Problem with rust module
To: qwer trump <vivazsj@gmail.com>
Cc: linux-kbuild@vger.kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 11:46=E2=80=AFAM qwer trump <vivazsj@gmail.com> wro=
te:
>
> ERROR: modpost: too long symbol
> "_RNvNtNtCschHAZg3Q02y_6kernel5print14format_strings4INFO"
> [/linux-rust/samples/rust/rust_minimal.ko]
>
> But I see there are many long symbols in Module.symvers. So I guess there=
's
> something wrong with modpost.

This shows up with `CONFIG_MODVERSIONS=3Dy`, but you should not be able
to enable the Rust support if you have that enabled (until it gets
resolved, see [1][2]).

Do you have `CONFIG_MODVERSIONS` enabled?

Thanks!

Cheers,
Miguel

[1] https://lore.kernel.org/rust-for-linux/20230111161155.1349375-1-gary@ga=
ryguo.net/
[2] https://lore.kernel.org/rust-for-linux/20231115185858.2110875-1-mmaurer=
@google.com/

