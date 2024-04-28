Return-Path: <linux-kbuild+bounces-1709-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31F8B48FD
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Apr 2024 03:01:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1069282936
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Apr 2024 01:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD3E7E2;
	Sun, 28 Apr 2024 01:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSdcbDAY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1BA64A;
	Sun, 28 Apr 2024 01:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714266061; cv=none; b=frpHQUI1Od4HwUycQ2hP/IBDbuPnHbRmvWvZB2r9sJRd8xz9L8Pe0LeG/kSq4cgUHO3M3vTkg1jpvl/egaBGkuIupBN6t9wf+nk2lpJTw0PZTSIh9YfrCh3n90O18IB7mgjFFlJh7cxNTsL4SA/OMZvf/JIfPhz7lNO9zD4igYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714266061; c=relaxed/simple;
	bh=CQPq4P7Mc2rn5q+BxrpMTetHqp2L2IxLk48gCda0ihs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEWAf9QqAAF+VcTjP/OIj+XZEWHO4zoQXjduYGR1bFpF+OjlnUXx9djpOFf0pK/WYZJqq2SZkzifvbyjcvXsNXzf7nZ0Z9iLAGTM0eVagX0+5d/CfR7ojtL4idy2u7BQ6cbXldlsJRM/2jzTBAlpPM7t9MK3qwi2hS0/fjQ2V+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSdcbDAY; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4dac3cbc8fdso985784e0c.0;
        Sat, 27 Apr 2024 18:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714266059; x=1714870859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQPq4P7Mc2rn5q+BxrpMTetHqp2L2IxLk48gCda0ihs=;
        b=eSdcbDAYiyL1ZzEQwAgcPuJI9iObp7T7yz4H3XuebUPAMwdHar0PECpDLaNxiX+zwW
         GRputQKMIv3an/wj4NWWOrvu5kM1RMSeZueV96gobcGbRf1DTOLtP1RT33cyAsb3SPpo
         o74BV/u4LhTZxkn3VHzOAzY8qc1ulSW6B4W7nz+Pu7ExjkOIZHX5RiwLlwUJckZ6B0Zk
         G2jpDYJMXEPUCxRqE9DALsEzvMlpH3VbORIx637c8k9hUvluudEjuXVaNuhWBU0eTVVw
         fJnhRoT+yL3hX3X+IVlkziM8M11qKiwyUJWPxysKLe0N/c8D6IagZ476Gc3G4T/GdZ09
         wjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714266059; x=1714870859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQPq4P7Mc2rn5q+BxrpMTetHqp2L2IxLk48gCda0ihs=;
        b=IvuCQnviPbjp3Erb9JTAUJkP0nTBhatjJx+PoqXcADtuQrZCU+PlsYAMemHRDFhpOr
         v7JNcgqpdAdmUD/8ppiYaQVPAymV8l5BX7gPZ7XQG5bHRVthzaNjKY217YVTGoz+3SLi
         WP5tVl/uLAN9rTWdopd/gvGxwTMvSYW98WwLEib3xsI+DxGjQjX9nl2Q8sOQGUoF8fO8
         WM4ko/UGh7YlNBf5w5mXBdOtLLfI6V/Gdy6LO27NUWeU/8OepeGVp36hhWoHxEct1gRI
         shqkmTGoQF4nkCai0nii5fzuHrkyID9EhSJl8F72kn8ZMRgOesgac/ybvvtsrbjwv2jZ
         pRTw==
X-Forwarded-Encrypted: i=1; AJvYcCVQK94x7oEcHyxgcA8a669vEzrzW3GRflMYWb18YPumAPeh3mtVuTIsBlNOKKyI3ReBNn20xOkhiQ/OpdAtFlSnrlPSi0xlnBZkImI7FrQ=
X-Gm-Message-State: AOJu0YxDqRtLb/m1IYXVR9tIqi9EWxQOjgxVjSqfYwL3pkCGdvtcKwvb
	9a4cvsuQXWssggMVDgXh6xwvEfrbM2qL9XYP9lU8OS2Cx9xJL8uPu7ndDD8e1EGjZj5jCGrqUHu
	2QY3jeimtCnEEe7LbUYPoW3stbTE=
X-Google-Smtp-Source: AGHT+IFY48aMbbZY9HMorCJuLm/mwNLuIm3ybUEhG4NpAhRibAQeWTEsdhKs74InLXZdraTp0py/AQdQxiF6MOacQVw=
X-Received: by 2002:a05:6122:c8d:b0:4c0:1bb6:322 with SMTP id
 ba13-20020a0561220c8d00b004c01bb60322mr7003998vkb.15.1714266058164; Sat, 27
 Apr 2024 18:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANcniXsneeNs+Hfr9PScU2aYPyvn6re=5T0Cu5dgAa4N_b7m4A@mail.gmail.com>
 <CANiq72mzHj+4pB4F5FbuyKVP7o751LxHosNeEu4UhHyWqwOmdg@mail.gmail.com>
In-Reply-To: <CANiq72mzHj+4pB4F5FbuyKVP7o751LxHosNeEu4UhHyWqwOmdg@mail.gmail.com>
From: qwer trump <vivazsj@gmail.com>
Date: Sun, 28 Apr 2024 09:00:47 +0800
Message-ID: <CANcniXtiRnNjcFCwfJpUrnnheep1ZC8yPuCsC6WJSWHgtHQa+w@mail.gmail.com>
Subject: Re: Problem with rust module
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kbuild@vger.kernel.org, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=EF=BC=8CMiguel
Thanks for your reply. I really have this config enabled.

Best Regards

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> =E4=BA=8E2024=E5=B9=B44=E6=
=9C=8826=E6=97=A5=E5=91=A8=E4=BA=94 19:26=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Apr 26, 2024 at 11:46=E2=80=AFAM qwer trump <vivazsj@gmail.com> w=
rote:
> >
> > ERROR: modpost: too long symbol
> > "_RNvNtNtCschHAZg3Q02y_6kernel5print14format_strings4INFO"
> > [/linux-rust/samples/rust/rust_minimal.ko]
> >
> > But I see there are many long symbols in Module.symvers. So I guess the=
re's
> > something wrong with modpost.
>
> This shows up with `CONFIG_MODVERSIONS=3Dy`, but you should not be able
> to enable the Rust support if you have that enabled (until it gets
> resolved, see [1][2]).
>
> Do you have `CONFIG_MODVERSIONS` enabled?
>
> Thanks!
>
> Cheers,
> Miguel
>
> [1] https://lore.kernel.org/rust-for-linux/20230111161155.1349375-1-gary@=
garyguo.net/
> [2] https://lore.kernel.org/rust-for-linux/20231115185858.2110875-1-mmaur=
er@google.com/

