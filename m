Return-Path: <linux-kbuild+bounces-5488-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792AEA11D04
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 10:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B457168CCC
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 09:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D017A1DB147;
	Wed, 15 Jan 2025 09:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH89h/Yu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569E4246A35;
	Wed, 15 Jan 2025 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736932248; cv=none; b=uOWOJQK3W9UoLUYayq/wTTJ64FvGNF9sgD4RwmKRzJuqEexfZ1Y3Oj7dscZMj0RjdIabJ8n84g4wLwiOfWeo1U3tGijCN7PEsQzhJBmiZriCEmRJkHmlPsH1PVgkK3MOa3SR21IIDdXZGrU2+SgfJMssRjWlOLooOAkE82Pz1pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736932248; c=relaxed/simple;
	bh=s4gowUCkR8ThPcXmpLKlGclM8lC6TIMzjSkqs9savQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hqAs5hb+BpqifvBarFHovWDjCFkXe7MxNWQni1Ssy82r12bWsIsgPA9XKI+fYuWtpf8KT/M0LVKsY7dujmmMZbN8VJFYcZFbTMuZ+NxK8zesWANH5C50jrCvkARTX9bKibFodo9ne34VdOgO+DOwQmlly1RaD43SDgQzUjzwn80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH89h/Yu; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so1345839a91.0;
        Wed, 15 Jan 2025 01:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736932246; x=1737537046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4gowUCkR8ThPcXmpLKlGclM8lC6TIMzjSkqs9savQ8=;
        b=PH89h/YuSRAissrvXDNSVWYeb4oOxps/RbuOu/+snzNfis1qxCHbxQYMO8b9YufGhM
         ZFpcpIbCDHz6O6yon+Q+5D/90QviirEY3zTWvXyyMDegCZlorXQTuv1uQrUM7wUrK+jS
         5jNdXPy/Y3eXG8qNWUl69SYbl3jZlr9vv678M0HFwdVLVYYewwv1LkYWLFfErjaXUjwd
         CNZDk03yKUUS2WGVzH6p3PopBAo7bpEUV5mwpkqxJChTVRdpLyqGWkBXAMa8DRlxrleI
         NZGirZtU05/lBIdHelPGGwOnM/lVa1fAckzKPWvpArcq/QaAvK3sMNXIcNCPozb9ryw+
         Juiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736932246; x=1737537046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4gowUCkR8ThPcXmpLKlGclM8lC6TIMzjSkqs9savQ8=;
        b=sIWMv5U/HoKpfy0sJmrnLbhx3U073y4U6TNvDfq6fKbXygO8DQuSr/IRuvEZ/D3FGj
         zOyLXu67t/PMnXYWozdP93G0noXavHc0UwCHkTwYSoSdG99l8gKdGEAzYAyOAJ7bIi9g
         aR9TGV/Uo92wjJsfcoV5dYaDdFU/n6yIyoc7hvOpivivgRwJmyjt3WHA6e3pfuorqi7f
         xkWLv8IvdKA6q0KLBRvOs1brKEHF3OjRy9sm8FQrridOxEqdXzdzgJEKnItKtXLmdEGI
         Rr7/xG6GXEdjt8ZeMiBPPrCeN5jd2pY7eSTUIkW2BOtn5T+MJvRXO6Gb6p1QxOTUpoj0
         9YYw==
X-Forwarded-Encrypted: i=1; AJvYcCWdnCwndlNuTlD82kuCgGijBCIYVG1MKnwP+aEgYTmMcveorrho7vfTfhgbhqzoLuDwvbFOZvyeXM0V4GXCko8=@vger.kernel.org, AJvYcCX0GOMqbYQYrYFyC5UrCZhCMQgw0A89PHdB7BAo2v8+DTIZr9fSKKugozVsCMD4cbsN6BAhxraIHO0OFAxy@vger.kernel.org, AJvYcCXWc66fug2wCr6FHiqZDiBGp8UpRFz8H9MZhAeaOJFK/XEvmbBY5V/NsjHH/Ae0tW4FS4AxblAEgBm84ML6@vger.kernel.org, AJvYcCXdWyEg1K6e/yY4AaLcSDB5JMD527XKR7qz1o9GCjnFTYBw20Q9onFuEeNersCLyQMiCekaDQqaQzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTaafdp0ek5RKT1DNDDfQ1Yhc/JKRjHlTO5PdwZ1TZd8d4pk0K
	nS/ydJMDUhVyO1zaG+zVnsY0DCwQr5SFwpMqf9gmIaAP5ZFkjMpZJtOLpOPusgyNkfY2lRmS6jo
	k3/JVCKUnwviYK9rwReueT5sq2s4=
X-Gm-Gg: ASbGnctkjI52v6a773LMXB6B1zNT/7oG8y4LTu42tlL5sn3oiJi+kiVen+2Yrn84e7c
	HiQYwLiOJ3JsIxwzmheTOVjBU/SXk9sRLB8rpFA==
X-Google-Smtp-Source: AGHT+IF5o5Fngx9F8mAKdkHS+kf8BLRmpwBINYjoHVCcfYVIb4s1YvcCTtZ+OZrv6w6UeWm6DL+Xl1deyoXsqkgUcPY=
X-Received: by 2002:a17:90b:37c3:b0:2f2:f6e5:d28e with SMTP id
 98e67ed59e1d1-2f548f1c677mr15527940a91.3.1736932246563; Wed, 15 Jan 2025
 01:10:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112184455.855133-1-ojeda@kernel.org> <CANiq72m+k07miKu=vHfp1-A+nu092R+khau5b95Ugq8M8sksFQ@mail.gmail.com>
 <CAK7LNASXLdya8d2Cjo9H2j5J2d8ukj27aDNStqWEVbDQFgsP2w@mail.gmail.com>
In-Reply-To: <CAK7LNASXLdya8d2Cjo9H2j5J2d8ukj27aDNStqWEVbDQFgsP2w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Jan 2025 10:10:33 +0100
X-Gm-Features: AbW1kvablhI2XqwtFDUl4ZnT060edaVgVSWH6gDoFIWIPktYypdDmv7lacp_u_Q
Message-ID: <CANiq72kpCMcDgpRuUA-5oJq5dYgtLW2bVkk+H7fU6CTtKAw4SA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: add PROCMACROLDFLAGS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, HONG Yifan <elsk@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 3:56=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>

Added, thanks a lot!

Cheers,
Miguel

