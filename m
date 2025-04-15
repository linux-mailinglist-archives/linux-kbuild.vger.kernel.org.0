Return-Path: <linux-kbuild+bounces-6612-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B24A897EB
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 11:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EE973A46F2
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 09:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87292820DA;
	Tue, 15 Apr 2025 09:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TTscjFax"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C020D284691
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Apr 2025 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709249; cv=none; b=MYh0GqMRLsjr0qCvroZkbNVgXH8kMHzSjSDBN/n29NavL3oQx434MFoU7aXpo2yOGq+YCkZEePZejbARz2mX6dVdOFVUjl0W3RDpe0Ptx05QLrv1fopsM5W09eJKGJSgdol4RYDOLGvmMF+lI1ZcYHJShIYURUmYT08i7k0k+gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709249; c=relaxed/simple;
	bh=ACQuDtLySJGUDdPySwcX9laZ30nm6+nLm5qXV88Hr4g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BItx8VGlAMQpnJuu66qOBs7w4wd39WW2wFGba2nYrZHYyeDWAvU/waDKDrdf6gMw7wjWCrm3P4P1By5HhASC3dn7tEQL2NnvTmAnhARs5yT86MwZvpqWJsYWg0xxoa26lpa2lKYhZvxEMQJ5MPk/Vml9I1MYiQ36/A6OtRLC2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TTscjFax; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so40257195e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Apr 2025 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744709246; x=1745314046; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xNqTolRYwEdQ0xZi5RcJyGoxOrWsQ0mEIGkr1N9o2c4=;
        b=TTscjFaxJJTBmBvktlTtVNPIhW4kOtmlmtVfJDUya0+0QptH5G6TO616jAkxIYgWzS
         VI/HF3KEb5k4gwdMtOubR51cHOTkl1SH03800okzDCgX2fj5lte064eD9JqOno+O+yuF
         A0MWFpMghyouF4Xj30Jjc0WXNd+iG84x94okp2IL7OEmND9nNAwlawQzB+cnoSsSAzTg
         dynNN2//ZE9c7Kge33bJihgvJyW9OX3J4XWIKFMdJyAM5AymCN/Qz5VFBgbwA/e+xsEs
         16EjoYYAfV2lBEbKQzXQceIdSBEcE01ozo9KvyYahcbovRGrFmlzEj9lQGIE1YbQYsxr
         HxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709246; x=1745314046;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNqTolRYwEdQ0xZi5RcJyGoxOrWsQ0mEIGkr1N9o2c4=;
        b=eFNAAYH/vTYBUQ3j+c1HzAgNkIRxJNjHwecOMFUYOPGiCTT4y9cVznVrDJUGe/SoX/
         McmxI5FcfLR4/23WyR588Lh9ps227SnE01t2v64yb/pLThbnSbKE2DAwxLnBV6pwDPGK
         exz5gyV4r/22RTqMG1tEL2n0m7lVDHZgNlyI3xmkoaIy3zpGtQmkdPoRWcS+pdFSZawF
         pTIHS6J6otC9JShPzpBmnn2qWRrZWNPvZBmP3SNlFjm8DCeArHbb2CpCFn4Ks68ECKCp
         GSk85mzVHXF7YhVCZj24ohnb1FoTnCYcZQRI26FNBC2/l9Q6I0wtGOi2gkKYIkKDebql
         QzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVlSviS9ct2Z0BNYMdOFg3d8TLbfSUyBDu4QWdlVJtINN2N05e9LVD7pxw+VGzllIHLRYOpzP+sxTrYEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0NEEtblDi3PoMrpP833pxw4LDNJ67geOpisq1FLL4yLd7RD30
	/DILxdvmRpB91DcHZISCvfFvUKIfCLIQmtHtqgxYVHndkCOxF/0Isuld1j2e6X0PpwVrXgsH3t5
	X9Z6dLNKECdrvAg==
X-Google-Smtp-Source: AGHT+IGNOnYD9JWXHsjrfEKTxmUhjAQDAgXAWdeq5XqvcbzsPrWDx2ckJ/DQU+m/oiKaf2kSydGbCqfW3XxRxAo=
X-Received: from wmbz6.prod.google.com ([2002:a05:600c:c086:b0:43d:4ba5:b5d6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b86:b0:43d:db5:7b21 with SMTP id 5b1f17b1804b1-43f3a9b4865mr111301865e9.28.1744709246233;
 Tue, 15 Apr 2025 02:27:26 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:27:24 +0000
In-Reply-To: <20250414171241.2126137-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414171241.2126137-1-ojeda@kernel.org>
Message-ID: <Z_4mfK2MK2xclvbW@google.com>
Subject: Re: [PATCH] rust: kbuild: use `pound` to support GNU Make < 4.3
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 07:12:41PM +0200, Miguel Ojeda wrote:
> GNU Make 4.3 changed the behavior of `#` inside commands in commit
> c6966b323811 ("[SV 20513] Un-escaped # are not comments in function
> invocations"):
> 
>     * WARNING: Backward-incompatibility!
>       Number signs (#) appearing inside a macro reference or function invocation
>       no longer introduce comments and should not be escaped with backslashes:
>       thus a call such as:
>         foo := $(shell echo '#')
>       is legal.  Previously the number sign needed to be escaped, for example:
>         foo := $(shell echo '\#')
>       Now this latter will resolve to "\#".  If you want to write makefiles
>       portable to both versions, assign the number sign to a variable:
>         H := \#
>         foo := $(shell echo '$H')
>       This was claimed to be fixed in 3.81, but wasn't, for some reason.
>       To detect this change search for 'nocomment' in the .FEATURES variable.
> 
> Unlike other commits in the kernel about this issue, such as commit
> 633174a7046e ("lib/raid6/test/Makefile: Use $(pound) instead of \#
> for Make 4.3"), that fixed the issue for newer GNU Makes, in our case
> it was the opposite, i.e. we need to fix it for the older ones: someone
> building with e.g. 4.2.1 gets the following error:
> 
>     scripts/Makefile.compiler:81: *** unterminated call to function 'call': missing ')'.  Stop.
> 
> Thus use the existing variable to fix it.
> 
> Reported-by: moyi geek
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/291565/topic/x/near/512001985
> Cc: stable@vger.kernel.org
> Fixes: e72a076c620f ("kbuild: fix issues with rustc-option")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

