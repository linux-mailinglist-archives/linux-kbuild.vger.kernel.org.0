Return-Path: <linux-kbuild+bounces-9513-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABCCC46F54
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1AE73AA930
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 13:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787E3313E06;
	Mon, 10 Nov 2025 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WlgablEf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B4031353A
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 13:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781697; cv=none; b=bwKlTYlnStsKk8easK8T/83IMfY2kuVDmSZApa/buauKZEfYvcac8Sc9tPsU0OU6rTsZoIdMsUa9eiDd9YT/ZdYH6cG2CHWSW1xWu8G8+OwIF4POoD+RjNsxyXJ/vU3/kJ3YhgrINgIpck+KdA6eLQvnX4NRRDIS2PLtEw2YPtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781697; c=relaxed/simple;
	bh=hOoHELQJUct+/jjBWDM/iGci2iRQNFOKXIkYMSUGeuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hjdVR2ykpWrXj1yGXw79fZ+CQKpa87we2Ltd2VkD8qgevDb2JUdVoIcY9F7hhsGO+28xK66K6/6VX/MsUIuIMSElwH1evUN2BDVQFhk0M1zx4bQg8ibW0ODkaYGJBYqavbqjSL1emy8pb9wS0XYmkMYYS93YV9QVqZZRBuJuYAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WlgablEf; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e39567579so16242825e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 05:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762781693; x=1763386493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOoHELQJUct+/jjBWDM/iGci2iRQNFOKXIkYMSUGeuo=;
        b=WlgablEf2ZxZFD/npMLOVEj4uxhJYiLDKZGJG/iBj83rnJ4g16cib1qrr2NHi7KIpD
         kL8Qw7IZemZ/suNsJsqBhO8n7AIVB19rQ7AwpLB9mTZ3R69ToB76lYFKnM50fyxBbyno
         RbsEI/Nqc66EBkpukv87OndMroafuYMybqhjRuSNtbf2uhcoLu44EX1ZU8GNXu7Aj5dW
         JGnbf3OPqPGH9PicuHDLBL81x/BQLV/g803szp0ZZaqgGxe9Bl/kn7sILwf57pDEbJwT
         TXi+Pg/JYqAAqOGEwHo9+4KBBW3L9G3OspQLjQ9INlqvEB5762GlcPXlFdQDdUU46LJf
         EPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781693; x=1763386493;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hOoHELQJUct+/jjBWDM/iGci2iRQNFOKXIkYMSUGeuo=;
        b=QFnZZiGrWXI+Qmy9QKS2ZFLsiHWf7PKsQBwR171cn+Pn0g+7D+Cbw4KP4/32F2+1hm
         cAOraq9pwj1YFSS9VakFG8LZfFsyWEJYSTykyAKf0MmEbMPG+/+A/GT/tAl3ZBe7m2Iy
         q+2gjFppaLLs9vrfTyh5q64gScasgbjuE3FY2e1QLAB9mRTSILwFkf04geDDvz/dOWIJ
         YgG9dwTlDGOMIAQseBkFVNKizUW2hU7YpAqdz4hY1DUuTI2JJNsSajt/aqPq8AAxbDlf
         5edlw6uGa/+Co6Q9+Smb47vjs4MR1lUcPbnjRm4UKkAkEDL1epXQ+67Ic+kawvLukk9j
         tx8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjkAqrYXxcEWnul1po7OZeQyx/SiUFiczkXFJN0ZjFHmAHXAbmewQitPcQwhhcaCk286gsZnqDXJ0HVs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMXV3ihulIvktmaKY5FgekrGycH59EAGH2TzSLRFUd9m4o5Xsj
	gn0+uXW9yb4EtD8kqXlfoV3lcfOkWTT+9psBD12NmmuJiJu4UcuYqbTOltVqiTyZv6XnR4P06PS
	RcwWnmlx0M5q5wSRwAQ==
X-Google-Smtp-Source: AGHT+IEhcd7v1I50vLKbfj11e6ZHlmUaM3O4D8Dzo9IdUzmf1+ToowaPgG4/VPB3oFSYHqCUiGhbSA+XEU/bilA=
X-Received: from wmoo8-n1.prod.google.com ([2002:a05:600d:108:10b0:477:55e7:9973])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1ca0:b0:477:7a63:611f with SMTP id 5b1f17b1804b1-4777a6362e2mr49082565e9.36.1762781693427;
 Mon, 10 Nov 2025 05:34:53 -0800 (PST)
Date: Mon, 10 Nov 2025 13:34:52 +0000
In-Reply-To: <CANiq72mGYKYZmQ8g5AbXCsRS+WPxbeaSyngR69jsEpY8akouog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-10-ojeda@kernel.org>
 <aRHOnGyLx-bEVqcY@google.com> <20251110131049.18e2f5c9@eugeo> <CANiq72mGYKYZmQ8g5AbXCsRS+WPxbeaSyngR69jsEpY8akouog@mail.gmail.com>
Message-ID: <aRHp_MadSjnYwHdy@google.com>
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 02:28:06PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 2:10=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
> >
> > So I think the implementation here is sensible. I believe Miguel's
> > patch is also pretty much replicating the logic in proc-macro2's
> > build.rs.
>=20
> Exactly, I was essentially following what upstream does for stable compil=
ers.
>=20
> (More generally, even if a feature may work, if upstream doesn't
> usually test "older nightlies", then I wonder if we should enable such
> combinations/setups anyway, unless we need them for a particular
> reason).

If these features change the public API exposed by proc-macro2, then it
seems better to always disable it to prevent situations where you
accidentally wrote code that does not work on our minimum rustc version.

(Of course, this is a polyfill and no API is changed, then that's a
different situation and then this LGTM.)

Alice

