Return-Path: <linux-kbuild+bounces-6055-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0166EA5BEE1
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 12:25:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BC951885F42
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 11:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BF7253F05;
	Tue, 11 Mar 2025 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnCvqARG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D64253B5D;
	Tue, 11 Mar 2025 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741692325; cv=none; b=c+BJXon8KH/v+2oOrh4WM+2ZmpODhG/Dz3O6V77Vj7Gc+Lyl/Ux7Ufg29FdMU4lj4oS63vpOi+noBcnBnd+HADth8tSls324Ir+k2h+PegX5g6GDohVhsN/y32kav1Ws08ch98GAAXHpK8yACxIS8aIZLwxOPHsB8HIJGufJ47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741692325; c=relaxed/simple;
	bh=uZ7Z+RehYAPUxpL5pUcapSesQqtDYnmhf5cqsLhYGO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiB47tEROw/ZHmQIfhHqtIyefK6eFMv3435a9nPWdKMd9txr0oyIaYaKSmA6wVBuMdFwMsv+tbDiRsKMInYk2t3N5aIQYf0qj57WSXuLfFztI4UrWP54+MwWbdO9MF0uMHHnNxDaCJlMXDW5mJizsDYjpYrBUBXh2kmvz884j88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnCvqARG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22409402574so11109055ad.1;
        Tue, 11 Mar 2025 04:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741692323; x=1742297123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZ7Z+RehYAPUxpL5pUcapSesQqtDYnmhf5cqsLhYGO4=;
        b=UnCvqARGYsyj6g5rm+NroaRgICgwVFmXARLnIGuewyzRTZqWLgVMetJXN8opQyQsKC
         J2WpH3u8mP1O4omrAnXE19f9US1YlWhe11gUWPUah+jmmWFU8eovElPmEzPYnlH1XbZ3
         948ypr+Nai7me7TPqUOS4q8ubwdJGv5JwtkJyFn73eyqpgZNb3b2DPkEli7K1TWF5SKw
         hdQo8Jwnn+YbEnqN08lzC6afFwNW6xszE73T557vnD+EP4KEvTkX0DB72AWRN9omsLpa
         tbpFM84BqQ9M+8oim6kcdnNJZ5+cufiuwmMe+r7eMCAedll3SUaQm7l9hC55tofj6knL
         vr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741692323; x=1742297123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZ7Z+RehYAPUxpL5pUcapSesQqtDYnmhf5cqsLhYGO4=;
        b=AmMNryF9b90WjKH1nItiRo6MTlKs3hzBum4kEppCGarrj/pUlM0nt6FoPWQKBgdXXJ
         D8AU+4T81cKzlCAXTrZXIk2pQWEuHBMd3FtTRhulpLQD/X2Vh7YLg/OpZ6x2dG1hvNq6
         msRIAF1G1MExE8VBxPIi0vketfrrDfXuPK/rXsf5cOUkmIhmD0TyA075PadtnN2nkr7A
         JEBO3KvX/wqVcZfjwX5PBrO1p/EwjSbE7RG7DeVufwBVZp8ZLbsOj98Zf8KKTQZJsKa6
         MY/kgCMEKfvT7PQznFr9gqA98JA68Wal46R6FqC36cfr27J2FJ8RZMKWMVFo08pAYrAL
         PUYA==
X-Forwarded-Encrypted: i=1; AJvYcCUdOyHAaByHDK4YKvF+4Pp4f0PgJy/vHBomP5R7oINK9V3wj1LWeL9k1gzzydQVsemyv9fzJWjs2iiFKUk=@vger.kernel.org, AJvYcCUqBiGwnqgk9bvwytL1J/8AipcCRDkR+1usp2i37/cMdliT9bX8as1CwYvw0SUEX+RjvpQgvYOaPpJoi9mtvfk=@vger.kernel.org, AJvYcCV++9E0jlTr2GixSflyyxR3uE6LpIEgWB/MmeB9UFln7khcieodJOZA9JHViKY6TAI1vuVd3V2ZCaxO1o2E@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc7yUe0fX8vpehEI9Gltx9/qBV2UFVQ9YbZGMuCF3F23Gofwh2
	nDJ23gi63xh6JGVmR8hF5ZZoHhPs/R7iYT455ZqHIf++gvlihJIi6Fjhvgg2I1L5c05yZ98Q5UF
	26aBqUa45GfNNnYV4eG5pBbQQA3g=
X-Gm-Gg: ASbGncvhNZVlnxi0snJtk51phY8SUxcYvkHImsA5880AfYdif6vLgPZd3idtj/KDFlc
	RMhbQfPptPQCvQlnyRChJ5XSR5ptq+qPcuX6d/1UBM3m9xhNVdJzdr4j0Y1VpRUVObfF0Az7ghm
	8w/nx9C2rSyj+jTB0MvggAwd9N4g==
X-Google-Smtp-Source: AGHT+IFerWSSRnD9v86YeC/80CVF/PDb0ihirl1213NdB/dcv5ANfOwY/e+8Y9lVWiGeMvAc9tn8g0ooXf5XvUlUiWQ=
X-Received: by 2002:a17:902:d48d:b0:220:e98e:4f17 with SMTP id
 d9443c01a7336-22541ea9638mr71862085ad.2.1741692322799; Tue, 11 Mar 2025
 04:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
 <CANiq72mcpVL1YXyDFi-PrbQ2Uh0WUA_VNqLZaOeqQnpY5HnX8Q@mail.gmail.com> <CAK7LNATKK4bZCY7izDdEzNcUu60wjH57TK8ESM50QhUG2a4bRw@mail.gmail.com>
In-Reply-To: <CAK7LNATKK4bZCY7izDdEzNcUu60wjH57TK8ESM50QhUG2a4bRw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Mar 2025 12:25:10 +0100
X-Gm-Features: AQ5f1JpdJuaCqSDi_HshZJxMo3vvlLqCilD4cHL1BkIjDHJ8ZAF5-Ex-MPIJtas
Message-ID: <CANiq72n9Wo6Mf7sVfm2akqiKknGNeTegiMesNtHzbHhWS4iQTQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths relative
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Ben Hutchings <ben@decadent.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 12:04=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> GCC manual mentions the below about the -fdebug-prefix-map=3Dold=3Dnew
>
> "It can also be used to change an absolute path to
> a relative path by using . for new.
> This can give more reproducible builds, which are location
> independent, but may require an extra command to tell GDB
> where to find the source files."
>
> I guess "the extra command" might be a bit annoying.

Ah, so you mean that could be reason for not doing it for the debug
case -- I see, thanks!

Cheers,
Miguel

