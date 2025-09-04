Return-Path: <linux-kbuild+bounces-8729-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E11A8B44A32
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 01:07:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B36C0166EF0
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 23:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87A02EDD74;
	Thu,  4 Sep 2025 23:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJO5xj3u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499892ECD21;
	Thu,  4 Sep 2025 23:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757027253; cv=none; b=ZF58/+5Z7xtRtJWzyCiE+GhY+E757g1QiuniS2h4TLBXwsye/n14HUwmXk3SPcJ7aHkafAzVZUU6njZCJykhmrXTWnTea+l5Bw0H3pWJrOCOGgVvLzxUmTW3iqlPwPExxX47NfB3V9RNMsW0Lt2Fe7unAMCXn7SJ6NpMcO40MfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757027253; c=relaxed/simple;
	bh=gFo0FzsLEhTLdi2d/DGYSFpua5RWG+8GUEb4r/4TtCw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eIlz+viJwbmDuAp4MLRKLaRoasj6MAR48arri5DRxkwT2wHqDTx+y9Knp+I0ZEBMtJ9jfSnhvSBVhm7eo4elM7g7wd/sLR+yXJGCrT8t93z4VZQGoVrRQafYH1ZczturfDaoojkWNUd+Plkf0qH7bgEzuTcqQmt3gFp+6ksqQF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJO5xj3u; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e96c48e7101so1688504276.2;
        Thu, 04 Sep 2025 16:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757027251; x=1757632051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o24FwX+ITQGiICc7H45rzmOTTaSz7A38dkMoC4FIPcs=;
        b=RJO5xj3uWcab81tO1B4qdaP9xXxWRA7nvBeKveL1SMvqmaMumDr0h1NTU3YZfOczay
         zZCurM2HjpnbBWwpwsPiEIkvnmDTXJjXQUustk2NHWZRpBOnGWATyll1X0whaloPYhJO
         SH+tYbvGmyTAK53NBlzj6NAadUVxr9woDPvy0h0nADj0MPXmjBCY/S4QHU1DcEYAGv79
         rK69kMoaqbEUMTmK8GhyqB9C6Hm4Dpt/JX7NXYVvy79kzR4fjO3nu0xxADMVRrCaZspR
         LL4NhaKCqsqCXUoHZgjioEy1FB5oi/SyFuSKn1oMPJS2gdngGmhe2YLyAYYkEDJpbq3B
         EiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757027251; x=1757632051;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o24FwX+ITQGiICc7H45rzmOTTaSz7A38dkMoC4FIPcs=;
        b=bOqFZ9q87KzrPsS3I3hiVettCW5AEdpu7eCeQ2wBiYfTCaqJqFhAK8p6Sg6ZzyOU0X
         sS4xvW7NQefNSJknQSUZdAPTwkGmpNsQrzbhDiLayujqSz3NQxdRNO8PlS5swje+lW9u
         JKSGIi4ghZlGNhvmdrharNk1ApfeGqFuL5sSx9tUGNa6RDHCJJOd0OavsuKwU5Kuo27J
         qdzeRWLj9LLFigtZ2Z6Fz3li477XhRLUObFKAsc72UTk2Gu33h7i6aki1lzV+qXA7tvb
         DsjfAhnoNiq7SWE/qRhS2HGib7MZW9beNHLRkJyEEB4VbMVm9wOsmqWRUFntHfYoQxZ5
         VXZw==
X-Forwarded-Encrypted: i=1; AJvYcCVa2ipwgzuF7IClx8Q5AVeiX8z0EkkwYy0r1sMvGNw3uYUmlgNWCvsBDHKK/np37VgwCOEoG5YMe1g5lB/S@vger.kernel.org, AJvYcCVqLhR2nciXa0DuBoP5SNT269a7Xm4poW3eMfHUeu+6yO4WhlcukwMyHSr7F+qxx5f4OjkbWsMCWkwJKq8Y@vger.kernel.org, AJvYcCVuqO9Z143viH23yroI+Ugh1d+WHLd6r5tX7jf8iWYkx1UGl846e0SDX+wpPPCn0aDPjaDx+fvtvLz3oNZ1LNQ=@vger.kernel.org, AJvYcCXr6E/RKpAYySxBEiOVUWuZqOpsd4250nMCzZbf2tq/QGjvhJ8eG2GJBdRoX+fxGfAqtq9SdBED1hY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRzpM1CVexiWnKbdeMVmzz4LhKZvTijdyd75Uppfcus/4QvHeO
	8nnXdbvgc4rRqKl8/upOmQrO1sIaByOpCcKhQ9hvMzfhWduB1yDJKYWN
X-Gm-Gg: ASbGncsPYH/pO9XCrYqm9/lQJVErZcxKaLDLvvm/NMjsHPFW2l/WAPBZVy6R+6Mdcsb
	hENDRB2mKivz/0Uk4PjAnYXjmgHm7KKtoiy6ymdiP5C0m5ZeoOcM0N2cslwX2+1p8EPCFHbL/fs
	1FFwJ7ePTmlRk9XoyFnPCxzlQtHaURlwG7ECl0uqsCfJ6+17LQxggKfJlikuwWvlZToIKhNE3rZ
	9HxpujSni0ie37f+t4CQDgl1icaKkftobCm0eGQPsQ7njp5gHkIGk1cGr4A44KnEQkCAaWOxS9H
	synUa261ZuzRHdLh+kCJhf7CSF41XtQPW4wEKcb7NoCLFrBJ58aJ85yG5qRsqvYShwfi59GYf4c
	3UT1a4ZTsm8LPi3YjGtU02UMdpmqYiCHNDEV4kcdGRJMJjTLbOIvv
X-Google-Smtp-Source: AGHT+IGO63MDek7I3AGn3ywdxwapbr9b/z6cKhhBv8np4smj4FEq4Y1WEYTgKI9LUqLR9fGRnNNxPw==
X-Received: by 2002:a05:690e:4282:20b0:5f3:317c:cb99 with SMTP id 956f58d0204a3-601780cd7e9mr4605585d50.26.1757027250697;
        Thu, 04 Sep 2025 16:07:30 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a8510229sm24951187b3.37.2025.09.04.16.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 16:07:30 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <1b95b2f0-e916-4a86-a274-da2ff7f9d516@gmail.com>
Date: Fri, 5 Sep 2025 07:07:20 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Jason Montleon <jmontleo@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Tejun Heo <tj@kernel.org>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jan Hendrik Farr <kernel@jfarr.cc>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Brauner <brauner@kernel.org>,
 Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 rust-for-linux@vger.kernel.org
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <20250904-sterilize-swagger-c7999b124e83@spud>
 <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
Content-Language: en-US
In-Reply-To: <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

CC rust-for-linux list, I missed it in copying from get_maintainer.pl, 
the thread is a bit of a mess now :(

