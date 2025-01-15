Return-Path: <linux-kbuild+bounces-5492-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F181BA1275F
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 16:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4A807A043D
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2025 15:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3D714A630;
	Wed, 15 Jan 2025 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHpNyWhT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7A24A7D3;
	Wed, 15 Jan 2025 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736954765; cv=none; b=Bj0YUmoOD5UrDa1aFBGJq4jmFBXj1LXUHkbcpSMWwCItLODUf0ZGxWhpzpQE0ES5DYW5/Ny2BhAAQNOcEW7ps4h0U9vrvY8i9xBYO2Fh6jxLdeL2AnujBDnf/eXTZc/iBWsvUENND3kvWXTdG1d7qbmK6MzXOKrhXxXlZL/Zznk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736954765; c=relaxed/simple;
	bh=oS5Bu0PKeMi1oxl+u86jkjs1sd8YAhS/wSqvsUauqe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEgXtiZtwOhK1AwkZC14iSNgn7fj6H8w1YoJXe5o7Gk65Rwqx2XM07RuUmSCJzaRgLlXX5nlZDCFrAJo+rTBqFcyxtYFhiikY1+HRBxmoYU11NwCUMW3lYsJZ+k2ln2NDbs3GajsPMeUq+sOcXnp6EsRps1YATsxcwYa86jNU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHpNyWhT; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee94a2d8d0so1389255a91.2;
        Wed, 15 Jan 2025 07:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736954764; x=1737559564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oS5Bu0PKeMi1oxl+u86jkjs1sd8YAhS/wSqvsUauqe0=;
        b=cHpNyWhTLOUbwR6kimNi+QLv6QG21LZ8H+VJfJ4ADuHl6AhhnCjd1/knEjHFXkLYc+
         bbYVAYreEUoMqi2tJ9SHFp8n/OPjFKZD6tstW6ORdw6DPNzt2a7w4UMnmA0EU+hrzhAZ
         Fe/cx7IKSZzNzEbyDY8l5h5mIDxB0UxlMytx682uAQT7k//vjq3rN+18fUnpwP6mYYf3
         Oh+B6ABPtMCAlSwD0BTX+HdD9iFmdHomNCibtble6x5CWIo33EPGnBgFyoMUoaOZiR4N
         dCEk0vPzKsEiCUwQ+8w9q7ix2mObkqJdqcseqklLuoi+kaA2dfu+yWCCU1EZNQNq4R6v
         7vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736954764; x=1737559564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oS5Bu0PKeMi1oxl+u86jkjs1sd8YAhS/wSqvsUauqe0=;
        b=OTT2PbLlvmvdoeGvxUJGtOkdZ/VcnEETAvW/xQEfldD1drauYJE+Nhm3WkfQ3md5No
         1C1rFP0XB2/gVT80PSW2XsqxRlmfhy+sO55RLWB0IdVWbe2TexlL/ovmSCvqvxROFwI7
         +PEm8ZnhzZrktzU35ewyu7DX+d4yUx3IZpx/ZKEldqy4cypETNUwWQAAN+6ekJNpW1sy
         uk+Mku8JuSX68N9yKKhDYbrGNYAyEm4Ns5H/KYq+QqfRJTsVL4lsu0FW8SwGPlp0rjXE
         lnRLbgc5Z617PoHzFPg3ulIcpHshglzbkINQ62SKqJPGeTNqUyk7Shw0tIAy7UmNYMYP
         EJlg==
X-Forwarded-Encrypted: i=1; AJvYcCUAfhcOvun+xriduhFsUt1BfOWDSZGOCKmCLA6dQPpBFg/FPHlw6pvuToqNvAekgr0NVpoKbtKp2xnd98UkDD8=@vger.kernel.org, AJvYcCVwMO3P+cTscDKDwcrBxzBTQjVB1EKXAyXAPVx6c2cvVrY0uGCrBnQMGTzl92kY+nrMWR2OL4XypuHG+BsN@vger.kernel.org, AJvYcCW7nASygtZ4mrEwhSCVmlNGhI2fd9KfAV2i3iKbTw/yzlR0qxs+oe+U7GHDt6fbGakXkodf/5GUoexHOPul@vger.kernel.org, AJvYcCWyl9cQLUMxggcxI4IV1iBUNAZPZzLI5DckkufyWu8T0aqYOG9BOHADo9ORjRZTSmNcbGQBBrGVY24=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK5sxX5wNdF2LlHnp5RBr2FIkDLfSiuQ0urH+ncgG1pP0+52+i
	Vt2q0PrbgGDVdu2Kn1C9QiHMLaGHHbS5aVXjzloZWonZ6FJWd3TV3B0onBMpMqzP/l3dDshbV8S
	RQN12WfcvoWaL2qKdW9dOrTo8Uk9NGfnB
X-Gm-Gg: ASbGncsPwOmT+FHnfRLl/I2+lke20Xic5A6qxjgQGqxJ/elS7nEJOXgPlPQFdCQWfvQ
	XL4SNqN1Aqq77d59CsjhzcNX4MAWGJTU3lL3u3Q==
X-Google-Smtp-Source: AGHT+IEuvaHjinrYdSDGGIHqYQ1y21shSye1Mm1xAH9Bg2IFjYO6qBwnOAGewySKKnoaj5WrOGhqbHAClvlRG3RF3c8=
X-Received: by 2002:a17:90a:d88c:b0:2ea:c2d3:a079 with SMTP id
 98e67ed59e1d1-2f548f3fc41mr16367753a91.3.1736954763662; Wed, 15 Jan 2025
 07:26:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112184455.855133-1-ojeda@kernel.org> <CANiq72=BvnriScFay8SpLNe9mNhjvGsBJ9W9UtdzU_6v_i+woA@mail.gmail.com>
 <CAABy=s12gOZadhYC+=6=TbbyN9j5L0B19ZLSGR_VFEdt1jhwEA@mail.gmail.com> <CANiq72kQKGG7j61bpsORnE0vzNo_dzwMZMLx=Z0xOnY0wefv6g@mail.gmail.com>
In-Reply-To: <CANiq72kQKGG7j61bpsORnE0vzNo_dzwMZMLx=Z0xOnY0wefv6g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Jan 2025 16:25:51 +0100
X-Gm-Features: AbW1kvZUpcYldFjbwOBXy94o_6lTFAyj-QS9S6GkQe2OruPN52aGDmHoW0Pxiqk
Message-ID: <CANiq72k3YfiEGT6JV5semYJWn5St8GMF3nhDW0Bt6rX1z+oDng@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: add PROCMACROLDFLAGS
To: "Hong, Yifan" <elsk@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
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

On Tue, Jan 14, 2025 at 11:46=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On second thought, #731 probably only applies to `rustc` native flags
> only, rather than those that are passed to the linker (e.g. if I pass
> a dummy flag, it is passed as-is, so I doubt they will start checking,
> and probably they shouldn't), so it may not help here after all.

For completeness: `-Clink-args=3D` appends (and is allowed to be passed
several times), rather than override. Moreover, the docs say so
explicitly. So it is unlikely that one would change or that #731
applies to it (i.e. as a whole vs. individual options inside it).

Cheers,
Miguel

