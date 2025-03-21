Return-Path: <linux-kbuild+bounces-6284-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB81A6C550
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 22:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95072465820
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 21:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C795232373;
	Fri, 21 Mar 2025 21:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="bh3t4CnB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB96231A36
	for <linux-kbuild@vger.kernel.org>; Fri, 21 Mar 2025 21:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742593435; cv=none; b=hHAPSzXGoWrm1WpHtWNmuutnE4N7Ok3f5AfRveCnDnsdYlyelIiYfTFPuxkoFOSLSDlO7DZmpAifmKOa1XXfSG3cbMPbS+C9acJ0KwLZYZRIM6wHv0j8kozZjoEDw+bdyQh17L7qfuyeVEE4w67clz0+U+u2ShvRVo6ulP/fH3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742593435; c=relaxed/simple;
	bh=L6SJzLz3ZHsbGmHxGldjAhRkD/PLoIDEr7kwiukuZW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekcNwB2h0qX0fk70tH/4veq3xEKcQESW/eub0VLC6DH/9cEx6FXUf0U/+DNFL/EuC6QLliRioam8h3nmwB5MZ5PQL1CHwfD6xRsCL7W+t6MUdRx/l4+kOkaDjlTlhKoECr6BXEh1/QUDi9mVnWMgEbDkxOR2uuYVc4eMbZcOoZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=bh3t4CnB; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e573136107bso2387167276.3
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Mar 2025 14:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1742593432; x=1743198232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REyftnO4MpLMzJPBIeESA3ysE+wlnss+4em0CBGNgTQ=;
        b=bh3t4CnBP2VNXErbGwiRVhGGSOEV+rP70zCM47KNXfttNoQzAG7FUQRm2QmU/M500w
         YHSq+eYo/8K5s8atR/snLk6SGpyxSf3vb1/qirzicwO77+GOU1JbYfupEMAeWb4x7etA
         tmkhFV9mncMui6zdQ5cejpLJWVMbLgjTNG/8dEMyivqTRGdkfO6Y+Y7uUfEIzfnksXXG
         LlQP5eogVdCMX536R3G1Awqw6DplRqgfnvj8mosiFjHLMpG2q2X0VxN+Gcmpelv2G/Cz
         dE4FR7ZfjtAWtJf4Qadam+iAJx0rU8pvytlwk9cWBfsEsRDW/NkteY23TOOf0vSGLlXS
         HNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742593432; x=1743198232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REyftnO4MpLMzJPBIeESA3ysE+wlnss+4em0CBGNgTQ=;
        b=Hw6D6dR7ugY7j9iLahQADEH9Xc8KUCxtKRb7KRVTZEZA2/LCIMjF3dRvxJnTY2WBTQ
         sveYLXYS0h9K/2XgK5jlsOwh6NfgNuhUj/LaleU0yEyuw2v6PR1sGOCWxObQVWJcejz6
         Yu5VEgR7iGozdnqHOQs6YWdhmVWRvelrGM6mPhLD01IR8We4/Gdjl47Pkkf/gJXxlOcT
         xIxpygVn1n51w8uyylzb8v0uhvknb+kHw7+hx4vBfJ9uLxhLbb5ZOYRDJ/9TQIIRpEb5
         FtNJDMnqZ/0UeNBAsfsgPZ2k3CK/sdugpTVrgsTR7lo5o5zLX6YqFMr9rxmHe43GwKXf
         o48A==
X-Forwarded-Encrypted: i=1; AJvYcCW5NKGSlYIU5L2H6LviVxV8i6kG3lG+dMVklup8Gy+Rbvz3ufa5LNQJG4UlFqo/sLto1ZCYmX4A7xgXmRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQYCE0aah9CkIckB808yf1rZglW6CcxQnBfvrNF8ISSw/ARln1
	hUQMOVfAlQ7BxSOjdkyIbqOSxILzpa0Lb/cJD6umw/cpGbXef7N1MtPXeqhCGk9F/Eb6U0jryUV
	kvO+2x/ASbkS3mo0GhWeif7ETKWunj8EMtudO
X-Gm-Gg: ASbGncsZpui2cNtW+ybsiUb0DVX34Ljw2t8ReybpQBCuFutw4xTbthG2WUoa0L4uv7z
	WmFVm/IahVd4+AKXwr1HsH1z3xLvXpL1mJS63FIqgowwrLNhyZoTL04uLkCQs3UB9oK4WDxRy86
	T/F0DSlugscUqrCylb61k9OqWm0A==
X-Google-Smtp-Source: AGHT+IFhgDBVmWXOeUx6TUA58CI2V05fBEx4cashmyHcm9tr6dKV8HHQqh2yAD735f9jloo77ntcLNZlqEMFIu5HtQU=
X-Received: by 2002:a05:6902:1584:b0:e65:c4be:6faf with SMTP id
 3f1490d57ef6-e66a4debdb7mr6842789276.21.1742593432251; Fri, 21 Mar 2025
 14:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321164537.16719-1-bboscaccy@linux.microsoft.com>
In-Reply-To: <20250321164537.16719-1-bboscaccy@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 21 Mar 2025 17:43:41 -0400
X-Gm-Features: AQ5f1JpI85RWt_bAx7UPP82VU95uOW2DFn-bKsLOFnqGS9WmBCQebXEYShkzoyw
Message-ID: <CAHC9VhTb90OxDKUGPYKmQV6faPjdzkuqE5COnWzuub8Q4otZaw@mail.gmail.com>
Subject: Re: [RFC PATCH security-next 0/4] Introducing Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, nkapron@google.com, 
	teknoraver@meta.com, roberto.sassu@huawei.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 12:45=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
>
> This patch series introduces the Hornet LSM.
>
> Hornet takes a simple approach to light-skeleton-based eBPF signature
> verification. Signature data can be easily generated for the binary
> data that is generated via bpftool gen -L. This signature can be
> appended to a skeleton executable via scripts/sign-ebpf. Hornet checks
> the signature against a binary buffer containing the lskel
> instructions that the loader maps use. Maps are frozen to prevent
> TOCTOU bugs where a sufficiently privileged user could rewrite map
> data between the calls to BPF_PROG_LOAD and
> BPF_PROG_RUN. Additionally, both sparse-array-based and
> fd_array_cnt-based map fd arrays are supported for signature
> verification.
>
> Blaise Boscaccy (4):
>   security: Hornet LSM
>   hornet: Introduce sign-ebpf
>   hornet: Add an example lskel data extactor script
>   selftests/hornet: Add a selftest for the hornet LSM

Thanks Blaise, I noticed a few minor things, but nothing critical.  As
I understand it, you'll be presenting Hornet at LSFMMBPF next week?
Assuming that's the case, I'm going to hold off on reviewing this
until we hear how that went next week; please report back after the
conference.

However, to be clear, the Hornet LSM proposed here seems very
reasonable to me and I would have no conceptual objections to merging
it upstream.  Based on off-list discussions I believe there is a lot
of demand for something like this, and I believe many people will be
happy to have BPF signature verification in-tree.

--=20
paul-moore.com

