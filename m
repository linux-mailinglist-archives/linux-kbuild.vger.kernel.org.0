Return-Path: <linux-kbuild+bounces-6300-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6EA6CC07
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 20:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A49BE174247
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 19:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751A122A7E5;
	Sat, 22 Mar 2025 19:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpD+4uAb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD371D5CCC;
	Sat, 22 Mar 2025 19:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742672486; cv=none; b=YxBZL5uXl3m0AUVWKiOoJMjG2lauWCPOVrWWOs50xi5RGE5LNgbGhp59Nd2LqCuqpBWnRJb/GjvKuPcKiYrRo/PXOOVjgNm8+IObjXlI/fzb9BjZza2H/AsT3g73gpQF/wWqpfM0MfXa5N2qAEdY6yPpM9EnvKUiSDA8UHVNBn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742672486; c=relaxed/simple;
	bh=Od4v4VdimPNSlf4DWjDRUdfHj1BtWC+yeW1X9qexnHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SfP1Da7Ku4l8l7ZJ/YPNAfPl0wPVPfD9eHuo21s7mUW6l+e83N4HZoo+hwY7D1YfGgFkpztA/6gqf/9wQ8SpyN2A6LXE9afPiY44ajM2L/No3MaSpgj0jTPMKPSBPP35/p7xbbt94yC6Qd25IIOvkc2eshkP/deRRFY/xlH/m6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpD+4uAb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so908565a91.0;
        Sat, 22 Mar 2025 12:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742672484; x=1743277284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od4v4VdimPNSlf4DWjDRUdfHj1BtWC+yeW1X9qexnHo=;
        b=WpD+4uAbU6qTaOpyXBPwFu8MJ/g8M/KXg31+XedKZu7OOH8U0weFfzrI06ZHoNv3zS
         kDgeBv+pOPxFISkq6j91Lw8mZ4cOpHk2EjabkF9yNj5w/mYDcaU3I/xmLf75hgAr9XcN
         GOIBWRT4+z0zK9lHq29X9J6lQF99uXOBvT2uaIe+5RTQBfhNS8izJhfTpsL7goM/EAA5
         iv4c6ORxYASP3Bt8orE5tFEyWoTwfIIGS1x08o/h0M4h9fvRCC4C8It9q9r8WymgAhT1
         qLVxa9IMX+p3mOw+cQGgCTVxVsKLDK+7J7lrfU5lBhTEEbcrUKA8Wo7vnzGr+VeJWyYP
         t75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742672484; x=1743277284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Od4v4VdimPNSlf4DWjDRUdfHj1BtWC+yeW1X9qexnHo=;
        b=tzyxTMfAkPGrb0NubnHIgskIXvb26hftYZKt2oIql7wKmx+lCilUZLUcKLXbw+TOAx
         FriMuKUB5H5NB1OAvWN1q7djF/B20yaFearK9RmpHuuFeVjvJPha9A2gjewVcJ7anwRK
         0sUlbshuCCN9qqRiFCbiTsp1IfFIADt32kZNbzdJY0YJkiy1CqxcrCBPUjUSgt13lSGo
         0WggCqIOolUMfurBVY5/l28yKe63z8z5aT5nHiTuiTLR6MCCpJZM/mS56zQKa2n6SOM6
         V2USGwjctjA8X0HGOav3nEl5gUhsZWohZk+sV/qvP499w5QhNqtYg43rzZaetQmn0xhm
         M+hA==
X-Forwarded-Encrypted: i=1; AJvYcCU6aFa2NShJRdjs75IMnK2t472SKuD8aVbFUDLn1yguvN1MOFsXDo4nqcA7vMbmZgzmJAJkIOjjEOIs86nB@vger.kernel.org, AJvYcCUUcf9ryMsW1Er7rn2vilrb/cZwPUlaJe65FJf8ARi2ZGh7Cfgj9OoBX+JR/CN7RaXOeyRkgYv1Lfmf4B4=@vger.kernel.org, AJvYcCWp1y0kIh+SenduHyLzNDBVJR7QNBTbOI93ieSrLBPQdd8/e2C/PzqhGV8fVGRisNMsEP8aJuZhVotLQeAI5cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMqpx3fDd8H5jE2rMhxYeF/02ggPTpiHCJixwqXWFwkU+LkQT5
	1Tc4wx40sOFNZd9JORim4Ha7tcZCVSZOSV6z41v+TJOYMWXotLRPGCe9I6R2FKYEuNFCpx1JgG4
	4Oq0ykYHfCiNlcC1wKkWZyu11n9vv4Mbj
X-Gm-Gg: ASbGncvyVfzqMwT8NGydMLQCcr6fAXqsjDRWfSU2KiZWJbnc94ARVnxDu/0yGVous93
	to31yMim/i1yxuyqWY6VW6oeAGKLvmzochOO7Wgvrv82lDRjlBZ1x42b5+Lojf8yik0zYCNPcqF
	aCpVwXH8Hi+ginq+shE/faUIHuBg==
X-Google-Smtp-Source: AGHT+IGeYvoNzBBSldPGA6gjhl4C1l31ys+AS9xab4fNp9F3UvQaQB7i3tszGVHnZp7x87VJsB2udyyY4XpkqH2x6cw=
X-Received: by 2002:a17:90b:1d91:b0:2ff:78dd:2875 with SMTP id
 98e67ed59e1d1-3030fefb123mr4785589a91.5.1742672484125; Sat, 22 Mar 2025
 12:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9=GHVfd=iRT73DviOD=6dio3U7wQWLaXAhKr3UG5-ivvw@mail.gmail.com>
 <20250322191210.1926380-1-contact@antoniohickey.com>
In-Reply-To: <20250322191210.1926380-1-contact@antoniohickey.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Mar 2025 20:41:11 +0100
X-Gm-Features: AQ5f1Jrh3s6Yc-9G0QUD3Vg_tDqV8v1fjEAUv86RJq_ycRiM922tpa6sYZ5gRlU
Message-ID: <CANiq72=5Q=H1dUD+RQE+Bg579HvB8iE=hyFmtDAJD77JqoUjpg@mail.gmail.com>
Subject: Re: [PATCH v5 01/17] rust: enable `raw_ref_op` feature
To: Antonio Hickey <contact@antoniohickey.com>
Cc: tamird@gmail.com, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 8:12=E2=80=AFPM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> Ahh ok yea that makes sense, thanks Tamir, sorry Benno I misunderstood.
>
> So the reason I extended the dashed line was because before my change
> the dashed line perfectly aligned with number of characters in the line
> I changed. I figured it was supposed to match the amount of characters
> of the line.
>
> Giving this a deeper look it looks like the all the other dashed lines
> are maxed at 77 characters.

Yeah, it is just following other section "lines".

> I will update this.

Benno is right -- no need to send another version for that, I can
remove the change on apply. :)

Thanks!

Cheers,
Miguel

