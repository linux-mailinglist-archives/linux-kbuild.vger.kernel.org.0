Return-Path: <linux-kbuild+bounces-5624-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E63A27277
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 14:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580EB1885EA7
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 13:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC1A214A68;
	Tue,  4 Feb 2025 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GsZwQGop"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB69212B0D
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Feb 2025 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673436; cv=none; b=dLdEdh3pFn50AtJg5/vqkuwUt/w2B/nb1AgcCifkutwXBXQMFq2VPart3Gsag/iV47KZwwnBrihJWfWqPZU8VEdvya4e8B05cWVy6S2Pq+wUr7fsyxZBPMD1bhq0XpzNEwTRSVIEDGQzCjrFzQCBhGrFrWvM/t2k2SbNlu97F1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673436; c=relaxed/simple;
	bh=5Wravk8n8L5gSrJ4Tsjze24NR0gc3nfzt/R8JDHkrzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGbiYtUL4JDaKWjlaqmXqCIOWy6SkTvJqtEZC9T3VOvrQp7V0piQPUSUKZu6ob9f9O/7rRoKphhj/J6NHAfcY3u8YRf3z+iWzGI08q+OjfEkfNOfiVyi/KIqMD1c7bfeoIk2Jypd+PAntN1Cx2QpqOmd1vFqjRy9nPhg34LfUb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GsZwQGop; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436345cc17bso41120435e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Feb 2025 04:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738673432; x=1739278232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw+RvYlLVEgZc4+jlXK0g8BHWRUPBup4VgYqbE87bNk=;
        b=GsZwQGopARiYq/juFef6TujcRVKV5rLU265YRViern6tWgtMCjOVoV/pjUg5Az4dvb
         oymS1jP/Sr7Pug7SxjhetBcVBfZhXRlaZX0uUdd5NeNW3Cd2Mxft39XTIbSloRUxy7dg
         uoBqzrJspW7lKloxT8442KLrvp+OLqVVrxlqmu5UDVz924KDsCOB4wCDKKkx1MpFfijV
         SdhbL3DxE/fROtdO1DpIoyluIOXk6MGXHpOLFzsApjf7PxHQBRgLhbSLypLpq9ewSSSR
         tITO7dddHq+GCvIVQawhsNW4GY8j/UaUZfj9nG4sER1tp+ak9iRXD5nnZygn2ASSmU8a
         Fi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673432; x=1739278232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw+RvYlLVEgZc4+jlXK0g8BHWRUPBup4VgYqbE87bNk=;
        b=L2SDnqaDrpcQxjfBERCBPbhrLoXtEfPVmKV9653D1b0wjjrj02Ytqu8y1X5TiGBiEW
         801UdYrvNS8UWn3NSqJ27xrxunpx3r/0vBLQ4+yXaquciDkM5Dw2ZWjn3xY+KCVn3YwL
         LikcNM1EGHJNW9ODnBNoWkQQmT6ibjaY91ZAxotU2WvtjLN2H3DAftGRJO8p+mPbHSvQ
         P9M7jqcu4TqEdwwMYPVMGrD8FYrb8atdBmmA7IFWY9PxNhPsILueYXDpwRKiagcdQH+r
         qfa0fGWZP1KmuXVeOa4qUlGUwjpyVsIH0axYCx/oyvO8mfJhm9nfmvs7xLb+HQLR3kxR
         co7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbH73zmhJBWT9MOgoIkY8fzD6O9JWhHv8AJCr7Ak6Acn4z20K7FxGspgGCyVzq6fbW4MvOBgA+tDLf8uI=@vger.kernel.org
X-Gm-Message-State: AOJu0YylJLfra3N0/XNa5G5k/iT36ImvirSrQcMbMvO5TQeW4b/1cBXO
	tByGui8IqkbyfcBKSFtYkgfsIYY+vaYGFGvEfMmJ0hffhZ5GGEEUPaHjIU2uWnrtipye/AyZGqI
	N+lM/+An6YUpzsxtq0JFHc/iPQivY1R61Ftxo
X-Gm-Gg: ASbGncu468eMW1pCD/AW7xS7Bo/Yqq/XaRhlW2K2CLIFLsqc8VwEpzzJvm0b6lGpcGG
	PDlSDbgngH7qWuW9QmRASTzvY9TnMhLox1WQfdyK9FTbmAvfD3+OQqfU5Zt4ymlYlJN7H4DI1b6
	aWDGfoVDx8ocmasURm/GzxB01vFg==
X-Google-Smtp-Source: AGHT+IGnnk4K4dvnw1pigNvIyl484rO5AHHh0Oi9KTNVimfTokNMh/75NQSAs357TKv97JHN4whdk6OEEaDnknc6Rwc=
X-Received: by 2002:a05:600c:3511:b0:434:f3a1:b214 with SMTP id
 5b1f17b1804b1-438dc41ef52mr196029345e9.28.1738673431786; Tue, 04 Feb 2025
 04:50:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org> <20250204-module-params-v3-v5-3-bf5ec2041625@kernel.org>
In-Reply-To: <20250204-module-params-v3-v5-3-bf5ec2041625@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Feb 2025 13:50:20 +0100
X-Gm-Features: AWEUYZkSscLm9QITCQ4BE11ZvV1ZiuaYYeibDFpJkeSienDQcuqiQO-NoGxF-C4
Message-ID: <CAH5fLgi-x6xT=xBV-Uv9do0tCaAOMOARZ5cigjsUBSyh2EJBOg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] rust: str: implement `strip_prefix` for `BStr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 1:05=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Implement `strip_prefix` for `BStr` by deferring to `slice::strip_prefix`
> on the underlying `&[u8]`.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>
> It is also possible to get this method by implementing
> `core::slice::SlicePattern` for `BStr`. `SlicePattern` is unstable, so th=
is
> seems more reasonable.
> ---
>  rust/kernel/str.rs | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 1eb945bed77d6592216cf30678fcca70d4c0b3b3..80601206961e5b2d682af5f70=
28434bba1604272 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -31,6 +31,22 @@ pub const fn from_bytes(bytes: &[u8]) -> &Self {
>          // SAFETY: `BStr` is transparent to `[u8]`.
>          unsafe { &*(bytes as *const [u8] as *const BStr) }
>      }
> +
> +    /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`]=
.
> +    ///
> +    /// # Example
> +    /// ```
> +    /// use kernel::b_str;
> +    /// assert_eq!(Some(b_str!("bar")), b_str!("foobar").strip_prefix(b_=
str!("foo")));
> +    /// assert_eq!(None, b_str!("foobar").strip_prefix(b_str!("bar")));
> +    /// assert_eq!(Some(b_str!("foobar")), b_str!("foobar").strip_prefix=
(b_str!("")));
> +    /// assert_eq!(Some(b_str!("")), b_str!("foobar").strip_prefix(b_str=
!("foobar")));
> +    /// ```
> +    pub fn strip_prefix(&self, pattern: &Self) -> Option<&BStr> {

Perhaps the pattern should just be &[u8]?

The code itself is fine, so
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

