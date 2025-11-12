Return-Path: <linux-kbuild+bounces-9586-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC7C51DD1
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 12:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A408134C1B3
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 11:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29518264F9C;
	Wed, 12 Nov 2025 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXSQr06V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E00223BD1B
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Nov 2025 11:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946082; cv=none; b=cW/JszyJ8cjh9bz/vaRpLYtev0kVPEzOuhUwADI+RwwICsYfob6w56QHzlHA6iWfZMPi1NhT1YRdFMGigeBWbovg49am1e0mnwolptIknPheWkAKTaZghY64vf6CSqmkk1dRVjMWSZxx94NhtJOpXw6KcKPJda655swv+koQNcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946082; c=relaxed/simple;
	bh=h6hMfbhgFDo+gCBofNGaIGR6RdADey1hjtSNOkDpSwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzQVHfNUQDg0vRfY7pX3cEsUpgCKE6v96LyggPPvsjc19trwOYfZRWWaSbuDZMdaHcAEd+FXzTNzt7sEc2p7xImQ+GL2PenczFlufMgNXgHRk3xCzuFXNU1EKix2wIdDxR7Q3ffJD2EDfAiGjBiez3PT6PUJbPEqV2oQ3GkNxE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXSQr06V; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-295395ceda3so735605ad.2
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Nov 2025 03:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946080; x=1763550880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6hMfbhgFDo+gCBofNGaIGR6RdADey1hjtSNOkDpSwU=;
        b=XXSQr06VR3icfBrhIVBXYOhEkXBwUypD2/Zbn/OeMbIgyQb9NlAN4cUmi1b+qwzrNZ
         TfmiyBnmm01BMw/VftgpiShBR8deP3nhco1AMvpBAwOUfKNCrQ9o3l8ofYrrz6rgxeGa
         XPinzy3OFFdr5+UoqdIpFrNMldYJEUvOgXJzsiCF2H2ASY0ee+tFnIYzYpoTBdowl5cy
         cU/73ZrH4vmlmfLuOKvtsoaiQu6koG2qhsQAvYc/3sLhjoKozhymp0PtHeFq1RKx9hVJ
         iLt7CPvcEgW/CLsM78p0ZbN6paiQtho4uMPzVzRPWdI/oHbAyFtDx1zwIoHDLzpqIoM2
         0tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946080; x=1763550880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h6hMfbhgFDo+gCBofNGaIGR6RdADey1hjtSNOkDpSwU=;
        b=Fv13UFKwkeICwpt8IZNMYy8sdWZWTYMXtBn3c1+BsV1xsohhatK6PjdEW6ayG3KNDk
         mbo4KnVxvepSUAwgVNu27ldWnvf9QznerRncOmFqxOhEvy0pbHk8orqNay+s7kFmZdHQ
         GG1bzHWuEwtMaiC+cfP05E3EqQz3yxS4esH4DBkqkKi1LUDBmgDWOIUsFYEM8X/3EMiw
         1HT/i2Wqzqr7nXANsE+3rnLo6c05/TNPxvTaCU0XWNSlOIogJRupGdlPfW3XUJlTeGif
         nOGLSsVJwBk24fvtXGk0UXx7q5Gix0e5lTmWgERZ+LFRgB08yf5q1U7jaxrExAoI04fZ
         Dr3w==
X-Forwarded-Encrypted: i=1; AJvYcCXRPvPBzNVMRSqoeXGy78pG1xJG6quzP0BRwuxZiK556W80U7F4Dm8nau/pK43HyE7sQgD37YdzelFVipI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqbnnkXF2NZVl4+O1yQzBRPb4zGUy+LFL53AAFk8XNHHgqhedz
	/ZoE5gkhwEvQzjbziuRBN5oXmgUfKu/O8kvdQYVG0CPSqFk/oFUJM/kGzxA/kYBmqq1PqpNByRn
	Jik+NQD0QPfuWSCO/AcA39v0hFff+uZo=
X-Gm-Gg: ASbGncseHeQ7GO0VGbGnqPWW2+lUFk6iyP9A23Rast+PQYMm2jlmlWZipJs8Zsw6kLd
	JZFtA/SJAC2OgdGnpk+p60cqfOlRFU3Z0aTqI2erbgCnpJ7jlwXdRTYarDnjEUOy0l1oFP/sPVw
	CTlpTGXzxpCvSkdYPnI0IPFlXdWJRcVl2pJfeHLPeKk0AKg6MVPPy5UCqusMOLHJbOJMGGwqXQD
	hZV0bIFb7r+sjOLOyhr/H1WYZo2W/OUvEt2WetrczAXDDH6I0C6jXtJsa6FNos60hw+3J1k+SCh
	KKqHrs4Pqj7XJ5wEbYLamCTegRE7pQ8vMXFKGYgnyGNtaepMyMhvly4tOcj+gGXDxl9Buz4ffsF
	DvObM8YftN4ainw==
X-Google-Smtp-Source: AGHT+IH+LDSJrK2CxsT+xWZOdZ7gKFmElQbYj/uFX0H6HJGbyKRr591NNlUWdNkrfJ7Nf3ybqLt6vVVhtmriacHHU64=
X-Received: by 2002:a17:902:c409:b0:295:3262:c695 with SMTP id
 d9443c01a7336-2984ed6e08dmr21652545ad.3.1762946079913; Wed, 12 Nov 2025
 03:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-10-ojeda@kernel.org>
 <98e549da-b7d5-45bc-8a9c-d05eb06a75e6@nvidia.com>
In-Reply-To: <98e549da-b7d5-45bc-8a9c-d05eb06a75e6@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 12:14:26 +0100
X-Gm-Features: AWmQ_bm8KNkpZ7dumhoSEH6BrwUYU-Dw3GKK1Imj_lLMN6rly1tXHJZJQTQ0s2c
Message-ID: <CANiq72mcQJnW-F+nb=Vseoa_amcwwhkC26N9BOs12MVfMVOdVA@mail.gmail.com>
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 8:34=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Looks good. But for future code and commit log readers, should
> we leave a small comment, to explain that this was vendored in,
> and therefore excluded from "make rustfmt"?
>
> An alternative approach might be to create a "vendored" subdir,
> to make it clear which parts of the Rust for Linux code are
> special in that way.

Sure, that can help, I will add it.

The subdir makes sense, although it makes it into a different level
than the other crates and I don't see it done with a folder in other
cases either. Hmm... I will think about it.

Thanks for taking a look!

Cheers,
Miguel

