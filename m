Return-Path: <linux-kbuild+bounces-4978-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E9E9E2C87
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 20:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5F02B2F331
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 17:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD59D1F8EE2;
	Tue,  3 Dec 2024 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iC6s4bFf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A34A1F76C6;
	Tue,  3 Dec 2024 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733245421; cv=none; b=HTl+yAIUYpy6OB+0WrVHkkX8R9097RfsJhj+JbIx3F3oA/T0fs7NgeYzf+tp8uNJVjngkBcuZLiA/PL9yTNJWP7tYQRvFrLni4joNyuakj7Ik6DGdoqBTwJT60wgpGkgoV6kRWx0LKFBfVrup759LzMy52vd7BMjTqZjM1D77ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733245421; c=relaxed/simple;
	bh=E3hcewTlyOcLTnAf9Eg8o4Sqw/w4ZTAeGgYqxAzO5V4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRAr5ylI3vG8Ooj6pQRRfOqCOZUH/9kwaGfb3w0YkayQKmlvDQTWFOoe5PBvCAvi5lJXDjjv71UAW+Z33QImKCTFDU8rd65CSRkaY8pzsuvz4cHwiRILpIDnLgfPO0+ZifYJj2uZOqdkGbcPRK6iTsQ7EkKRUKInbIO75gc1meo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iC6s4bFf; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffa974b2b0so58648681fa.3;
        Tue, 03 Dec 2024 09:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733245418; x=1733850218; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E3hcewTlyOcLTnAf9Eg8o4Sqw/w4ZTAeGgYqxAzO5V4=;
        b=iC6s4bFfNBm2o/6yh+UtAQsY1UZn09/AmKbc/qhkYBbOT1tI8NJ17aSzOMWMtNpJUr
         jStdgDaLxL7KOz5FEL4sWFUbyXjHXoadFyL/Qgm9NSxd8KoSy9EuFARWf/BWGI0hjxak
         tPzpB/CqN5sN3pW3ZulPQdd5rbWa0TW9gQ3OKJTN1AznPR/8lHxlWGN11MPz4gjMBwQY
         hQ2kYQc2TLZXfF4v+PFSaBQ5kfKH4xfnK19GmH8Zclifh7prFBoLHVWCYjlh3uAH6BR4
         19LBW6cSG13qh49DYA/gy4TQfQtKi97+H+2MhvJrrG9QfUWmiJwJ+ZbB5XyoN53hebD9
         ZoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733245418; x=1733850218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3hcewTlyOcLTnAf9Eg8o4Sqw/w4ZTAeGgYqxAzO5V4=;
        b=efkD7zO0RvpFYIFDkuQTUuYn1TBklBhRc35y2bq/98ysNJT9WRBOIPCUviyoomMGhd
         qhdT3j7YxuT0HKE/fUYPcGm8GHt+ICwBBVLYH/MEFB8UyVzTBqENCGoqQrPXwCyfiuep
         i2LzCECqOXXn9J6YIgJ2UDRnE+5uE27A5EP8Dt/87fWoPuwuD6xpu70jixAXf48cdaRe
         ZamOxlgJvRBZ3KxtUZjyaf2LokM0auY2t1SCHOE1bm4RAPQmZFPwaFxZuUPH+lAdq5rU
         FCqUY0gc0TElKuY6bdjNBwJQ7i73qqZKr/gVXWyRpBILwvk+tdV8eB+gQZv69TZQobN+
         I9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUocg/GmtgmCPtKsj8OzEHoVE6yaaac05jUmdvVBFMI5EXWSOXFmYSwk0/2uNKw+tCGuCHz/XpgS8ShozY/zrs=@vger.kernel.org, AJvYcCWeNa+FSwWQ22V1U8H07esGGRdBc3p0ZUQjlC8HiPicHnhF6J8WblcfSCdGsYN56Q8tmQkr6FBNzay+CxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUreIT/WwW13rx12arwgy6eIDRJUIBXQtvcmytbh+AGOrEilTD
	zY5FT9GN8wGs2hqe9rOhbZXO4V5T4znDc3FCj1lcP1ZmGNHe09+lsaKG2AGvGizZmx66qv+1xG8
	HGrVMB+RcGp+Fa/3GlNYGipUOnwM=
X-Gm-Gg: ASbGncsusMwnhK6yT01j+Oa9qGZ2nkBb7DjFr42c9T2ag/qRIMog+53U2XstSZLu7Pw
	lgiDyWud7L9elJC1rAoA/GSVpc4Or0OHkcoL6GuXKgwPaeVk=
X-Google-Smtp-Source: AGHT+IGraF7fxPX7KiWWaAjJF07+mEgcjdtRuA8A8OQKs6/SdJmHoc4uijFxrFaq3YHrj8cL81iMj7iysm0toJbh5xQ=
X-Received: by 2002:a05:651c:546:b0:2ff:cfeb:cabd with SMTP id
 38308e7fff4ca-30009c6cfeemr25991641fa.28.1733245418141; Tue, 03 Dec 2024
 09:03:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105-b4-dylib-host-macos-v6-1-4e66515e6630@gmail.com>
In-Reply-To: <20241105-b4-dylib-host-macos-v6-1-4e66515e6630@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 3 Dec 2024 12:03:01 -0500
Message-ID: <CAJ-ks9nbwwtpO6TX3zM2Embag_7RQMfA0iBhtS5TS44wx1iOQQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v6] rust: use host dylib naming convention
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"

Gentle bump. How can I move this forward please?

