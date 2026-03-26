Return-Path: <linux-kbuild+bounces-12288-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDGeLYZxxWkU+QQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12288-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 18:48:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E4A33971B
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 18:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA74F302C35C
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 17:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A59426D2E;
	Thu, 26 Mar 2026 17:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rM1jUvbj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84B426ED0
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546298; cv=pass; b=XRDe1GpSMtiT3qbetLe+LcSnrle6UriiSXx1TZqDGI7CV5XForSiMLYQpGGMvcsrg28ruXEVUxCvhENl0+GXTr0dKqCKNCWOZaagn9BtIeCIL6vvix2mJS0agDhFmvhLicrjB4S/Ai9tm7z70UiavT+v0eXLng2mC4Nt1vgtocA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546298; c=relaxed/simple;
	bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nam6tNveshGG+VYbZ7WMb7NVsgQ3jrxG4ECDPfowO+UImT4j45bVhdRjwXkALkqkvxVEYW4Jvwya4+Px/WiETEodjKftNHFllR7bOSmpmb1Vrcx4LMt2bxP+l5f2Y/MqdLwt4s3CZ2ur5WKQ0/zaojqsLUU23HKKMOQibglLLqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rM1jUvbj; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-124a7216c9cso85185c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 10:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774546292; cv=none;
        d=google.com; s=arc-20240605;
        b=Pe3CDUGjs48Dxw37BQ339aVhh+vISYAfDak/yijOVZWNXjE+faNUKzeW8fYMAiMI7l
         1A65Wisz+jVJd45hVUo8FBLOpeR8fi8+5XCsrgmRT0jO0cU/bYOHfPEPIE8NFHprPM7p
         cgD6/z8h92m4KXT5ir+NNpBbCwPOYzwagmQkRX+JkpyVzXiyTP65b2V+ANPhDwaRt2c9
         6RfB1oeqOMM8yU4R8zegqrmGl1XdTUkjsaQ8HDHiouBt3zWza8bzvDfMDuiWuGn5kw8g
         TMirfT337TSmO5SloJB+vwQft9kYR+NeoLMr6hxbLRWBOCWi+axNx6zrorSqQogBorUo
         uW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        fh=LTGuxOZ9DTM+gZKT7VdaUhi5SL98YayTUmtxdYnesVk=;
        b=Xm4zVA3j06EYIhg/9kwerxuhju8mn4wEftfZJoM+6GvJmaZK//DxxeVrJ1/CCApgvo
         bXZz+Ra5V7WjeEJcDtFPmZlHrpDhAFbun+cm09VXVRnlyIN1AeANlXQbCDQ0uOsI8M4L
         HuK1uUb9rJqbFT3ReUct2TaAqOi2NkFoYBj/d2+ej3xy/gG8J20YJj1GgqpOdGTPItkp
         O3uumJjGprZWnB8bttlK7MqQJwHuVgOoo1gU7kCGVBnrne/KJJIJ6jozOUmn0MqnamZ/
         wdlNOhdqWFIGWQT+RlkMuo6Xjx8o6b1F343nZrWdND3qPvpdypcY7jkM2L0r87wf3zFF
         S4AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774546292; x=1775151092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        b=rM1jUvbjbfocQg2EcdOe7K/Cps45yYp/nwzXMIXIfP6ldLDskv5xhW7mUVt0d+HFo6
         FJ2ZOTg5yFRhagiEGy2zFeaCybwAaSAVTs+0X27nAcnfCADgjFWN1EV3BDapHeIZylAG
         GLkkgjcWvCk8sIYrAO8Z752AK8KqKwIKj/kPTSXQnxPrtHaXKbwiyXQDIu5pRrgcQu6h
         afXwPZHjSYqId0p42qtl5huMHlzuymQg0GPQ7HWsUFdAavGk2XpRkYOZl53y+t12p43F
         dy4ztNh6eOLiBPoiIGIYIk6rgicG1sb8M2taPamP/8fyBktx/MbNDG9/XcGEuv3kpeEw
         KlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546292; x=1775151092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        b=PVEU0NcKV9c9l3XLnFpG0uNaAvrmfvQMA/wx3oR10/5JAdt9t4tZggYxJNA+gLBXX1
         RS+AUu+HGSl470yS/yUpNVvSvLwQumi46gxw/zFevboQAUc/6DOMc1M5VlCqtm/bRDrh
         91cwkG8fuilVdaEnKvF4ACb91aa3UJJZxMRW/7WSK/k7z6ani/9ddWpwFk51Z5bsG47B
         d7SSXNlulY571X9Vnfc3aVNOO9yFgcLsR4eXFnRg7w6sUlRKGBcyTwtx5nH/DJHKBPB4
         +wkzY2VLfwE2zLF2cE96YWLE3lLLeL8IGpNOAC+nnX17K6OjMwJlvRpnHosbN9PEtMG9
         5iRw==
X-Forwarded-Encrypted: i=1; AJvYcCVbe/mPwzYrRWHQh9ER8wKq4dVhbm12Oayv0ozrQkqm6ahn3fg51nJ3MADxUnhpBy8LoM7VDQZqfMj5YLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC2s7bxzwr+35n59PA/paIc2d765ryTglJFEoICx7HWD71zTJf
	jyK65CM8GdNIjwQkvoIvcl0mfoZE5M1EU/NYf3QLUPA3e7VW2v1TRYgWCSWI3ROWbQ8GhBgrfr6
	8uJcK3dVzhzj3BvIuLGJZIVLr7otsZrM=
X-Gm-Gg: ATEYQzxaGrTEl5dhQF3KAsjO5XkN1kUF+Ruyb05gc07qNz/Ynpc0V150uHysnM3/gFM
	+lijTJgMGKr2ZRupwYFg/XwCH/0Fgw7CDQfHCSyJTzY2v18OFfU9tnIjzS2/XqvxuEVRUJoEtE9
	6+Lqrcy4pUSwgfO7dc6pxyJoWAtMMf5jfjdKvb3LPCGOQT850+xu+fGxja/hgVv+K8/pHeVRpVm
	YxvmS2cQkm1b2H9o7kOWlJwMDQO/891vDXLQqcqedhnyYUFvw+j0ZmxURxuNIzGGrX0GZbGGC+M
	xt3kY2MeSfGDgkmk/p4+l1AEBsW5+4H8OQUI1QjT5Rua0MaOVjz019ZN7JTqxiMD+QNM6hU2gXF
	bdJ2KO1j/B7tF1f/7V/+gIzE=
X-Received: by 2002:a05:7300:cd8a:b0:2c0:fec3:fd2b with SMTP id
 5a478bee46e88-2c15d3eebdemr2110432eec.5.1774546291859; Thu, 26 Mar 2026
 10:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com> <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
In-Reply-To: <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:31:18 +0100
X-Gm-Features: AQROBzAY2TUlph37K4tdyrXW3PnWDmlLF1E76Ca3evvsqWc92x8ByVyN4OKTlu0
Message-ID: <CANiq72=fm7FnfM2iqOLvsgxxx7X4LBkr7XU8=LWYqSzQ7zjJ2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net, 
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12288-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,kernel.org,arm.com,armlinux.org.uk,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,linux.dev,infradead.org,nod.at,umich.edu];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32E4A33971B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 3:31=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> It should probably be fine to use armv7a-none-eabi. I've mostly used
> arm-unknown-linux-gnueabi since I though it needed to match the
> bindgen-target (which is -linux-gnu for all architectures) and
> because from what I understand clang also uses arm-linux-gnueabi [1].
> Also when I selected the target I thought that we would also support
> armv6, but since I had no v6 hardware to test on I disabled it.

I see, thanks for the quick reply!

My current thinking is to enable this only for x86_64 and arm64, so if
you/arm decide to switch the target (and/or enable this experimental
feature), then that can be done without a rush, independently.

(Please take a look at Russell's reply as well about the short enums thing.=
)

Cheers,
Miguel

