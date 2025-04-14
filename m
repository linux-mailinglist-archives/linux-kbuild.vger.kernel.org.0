Return-Path: <linux-kbuild+bounces-6604-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A38A88CF8
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 22:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBE1A17BADE
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 20:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDDF19995D;
	Mon, 14 Apr 2025 20:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuVRJ46s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33CE155C82;
	Mon, 14 Apr 2025 20:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662189; cv=none; b=dNy0Vv3RAQxK0o6K4WzrF2Sdn69Qb4b9XFu4ryCnOHIUeuqpJWhi1gCBFtSr1lzpIbkWxZZMLweNRyt/5HXJ5VLT1jAJjPBJzhNB3lMbmH9M9NiTWY5cfxDN1Ntlo7rpP7zDvSPgBgr+qWXgvTx2sn+QxYtKzxo+sY66rL5kuPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662189; c=relaxed/simple;
	bh=pgwH9G9Z5XgUOKl+P79Q5KZCCe2yrjR8tSQ/gnwaIgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwXEVG3+VOoI8HBuArsE2HrKXdTWYk/Z1QjabqoJGZ7elZd7ECvUpM9skM4fB9my5fdbii++lagXtiCmaccQoBhcc0MWO38vNmvTEksZf62mjL8qBK2u+PUFUqGq7Q2056gQr2Qd5RJaZcTJxzYJLmBKDcDv4ICOTG+OOpbh6tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuVRJ46s; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af50aa04e07so394005a12.1;
        Mon, 14 Apr 2025 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744662187; x=1745266987; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgwH9G9Z5XgUOKl+P79Q5KZCCe2yrjR8tSQ/gnwaIgI=;
        b=FuVRJ46skIff1rtH3B02ikEm9DCEwPZw8EpKjCkG8j6iJFV9sbE8QDtjtuYQVIkrbI
         1bXtuAMchsHibEzuGfjNEzCXs/8LcLlAPO+xBrsbDtNhvMaz4rQxA1dVb2pCjuRXjZud
         d3s/YqX6VQMlgJ9Yef42iT6aybAb+UO/spT6JdFPvM37eUieKSvyFdkLuJLDnern5jBz
         Ga7aJ3XOwQadsAZpwR4CWWKHbiohDZGGjfYKfDq6UWbLUngBM+JrcxlKroPqFkboOW1k
         NBF5MKmubpbUnXhfp3+TvS6KKUWYGKuPcJ1w+6C4MpPVKf5I3DPB7vg43n4tvKeQbshd
         rKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662187; x=1745266987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgwH9G9Z5XgUOKl+P79Q5KZCCe2yrjR8tSQ/gnwaIgI=;
        b=Z8dJaa4xc0//U7K6qLxAvCZ/aprlPanycbPo/AXJ9Bb/pgMHH2Jr9aSQZbY007RRcr
         lCMyr6ibzox6yH+/y5NCCCeWsADc7SnV9zofl79CQ7vDY8JmemXu7SItP+Q4bXGtdMnG
         QEM4DQScusw0Wx8tQvkkrDbmjkkQIwFaZw/FrqPoZPuVjEpANu1SrwEchQyHDRS862z1
         LCoMgjeRuJGUF18U4stKZ+wcNwWbrsRKyyQB0n8HihmUpKWn61Ezl1E+Zvh5iPfFPsNg
         bTqPdcUCr2oSHNxxXwTqenu+ijKx8DBoms4oeSwtTlboXLoXd8hJlGnakcgBWk7CMbdy
         rQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLhfmWHTjkkl8s7OpP6Gp8kAb6Wy0Q08xGw1wj9Oh7RhMhM25oj/Vgyojw4++EHPTangkk6bWFHHsVhf8=@vger.kernel.org, AJvYcCVMe+NemWrxmwxHEUc0Hs3trNkB79YBl6phznUPCV6hZ/uhRH6eOJPQkBBTxJa/C94ADb8HoeDYujYHrUeCTlc=@vger.kernel.org, AJvYcCX/Ks4HJpNynh5GitVAs/HUUY/1UJ4jICNAzSEhPcf1kKLcBIA0nmubf1u9PEk70tQJqWa13iDOmHBUpwDD@vger.kernel.org, AJvYcCX90yFSbYFNXYeeNZ2Hz0PZ+liEBDkuYuU/A0URKZtkdN5hvdJUmNriQld7l3SZ/lSGstap6lhe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt3RyIEAFSj80DWJo7I5oIirrLtwi0g+X9odKGTtcYHSUzaBDq
	D3CdLUbF7LYi91CvRr/xOSuNX5TyH2Q19jywjg9xF4dvWM9UbJLUs074XPCBtiTkoy3AIpkFHFW
	/eLbqYDZBAMumLP0A13QzcQClIIo=
X-Gm-Gg: ASbGnctGCaKqgU9NyLusIFbxEh27Ym6szj54b7uHvlYr7Y4/djnCmn9sP4xmiuvzAj9
	1ZVfWY0f9SYtT8MAuDytFmoo3dx+5kIc8+mukTOhQw0sINp2bFf015hJxwx/SLCJvScGW4qfV+S
	ZJoJ762fiCmmt1TjKrA+sUmss1X+R+Zuq0
X-Google-Smtp-Source: AGHT+IE8lDVhXfx4QpCOlSPx0TEX0rr/XZDgXqRTo1W6pH6GeNLdFPig1QevSP2mJMRR4WS0tWFlOT00RW9nujyQbbo=
X-Received: by 2002:a17:90b:1651:b0:2ff:5540:bb48 with SMTP id
 98e67ed59e1d1-308237e291fmr7719166a91.8.1744662186769; Mon, 14 Apr 2025
 13:23:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414171241.2126137-1-ojeda@kernel.org>
In-Reply-To: <20250414171241.2126137-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 22:22:54 +0200
X-Gm-Features: ATxdqUG7GLyRN3-AU_RPemLfMtwDRsoWtduWsQR0UuCp1mItMnHU5tGCPliq59U
Message-ID: <CANiq72kkXVLg8qaDmQj26Gi0jPZvqTad=qry5p5LnaOFnnWUkA@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: use `pound` to support GNU Make < 4.3
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 7:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Reported-by: moyi geek

moyi told me it is OK to add the email from Zulip, so:

Reported-by: moyi geek <1441339168@qq.com>

Cheers,
Miguel

