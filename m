Return-Path: <linux-kbuild+bounces-12903-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLdbGFf48GkpbgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12903-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 20:11:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A348A7A4
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 20:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AF3730A8104
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Apr 2026 18:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E22466B76;
	Tue, 28 Apr 2026 18:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVsyUazC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F0845BD5A
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2026 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777399607; cv=none; b=ERP5RnVdAJSa/g2i3LlFeY9Ou9nk3W15t3t8RIJD/Z3c8xehx695tLWCrwCmUe/wNk2KlYylfe3KjwXWI3aB+GP46OV7BpvGG5lot7NHj9qBTw88ajvf+fwmGooEhorFkafoop3PSjF1J2h+AWqW5X2yRnfaI+937Oby3F/dPZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777399607; c=relaxed/simple;
	bh=yqjIjtfKgVcLUYBAkjRAo0Q4mwh0fZg0tEEipx5Dfi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQtRS0HcIArfyEQ6HtznBzGbGVgjr0QIWbuGd7ilEwkKjr9MCs+XYXL65mBd5eBG86+blkgzd/MFyKwIuYJErgZ0CwE6ZbYZz2g9W59ANTgFFR3beK0MZOLGCPtEGQredpH8qXKs+j12VKp6HIVFobs1I3+peFpQdByfroBNcw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVsyUazC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so100959615e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2026 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777399603; x=1778004403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yqjIjtfKgVcLUYBAkjRAo0Q4mwh0fZg0tEEipx5Dfi0=;
        b=mVsyUazCkUa+mD+UNyTbb5pBWokKIT9NSdS9Rfh592apXYqnod3e6NosRSLp5I3I3F
         Pd63tvd8u1pyHNpckS4El/PbgtjWE8wXr6XjgeYoCkvvFfdqB5q4eEfSpIqbyFP1zIt8
         /YLF097A4o68V1LOhD3KnAu5E1klszfD5dTl3cZJFsFiAFSqK3lxuk5DzE0R9hzTzsyg
         UDLsZYbMx+X0d/THmic2/+diCNjqjl5NrTaXreogoEHQWJFDKVOlBckdAzn64qvseHQI
         RdDRjn3Fms9bLCjykD4Rua/I5GWxHuy28rUKfDdZxHD6f4KZzjZ9uasai5meqM9K4qU5
         UVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777399603; x=1778004403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqjIjtfKgVcLUYBAkjRAo0Q4mwh0fZg0tEEipx5Dfi0=;
        b=eK2W+CSY0dlic3ixYdW7EFb6FBhwZtBXLhI4g1R2VtAkfs1WOwPc5fikccDeqYy/KM
         Uj6buww0PZpYCE4cNNskRc77RewsnEc1S1qydtEqQTjuVtHNMRxaETXU512n8wPSd/zR
         h0efcoh70sGg5aOySrlMfqMwiePRoAakoumP42m2IMseyNbcCnhJXCUjPqGH0a4JSB+F
         90loXjsn+Ax7QXFDFZ78mBaklhppuSPgmJHlYFlSg7DzNQl36Rqi4YYSmE3kfoKALywW
         bQQyIHvLLJBYCOeRdldMxT2uK/W2fsSZO8Vm6QcDtNjTVDxF1k8epM4Jl7P4mVfzhvV4
         bo5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8eJW/g77IF3qxKjbtYoAuGLOal+kx7FDKFY8YvdGDvOFxtST4nNczciiZbp2ZqT5er/Xlw0c/e0TFpaQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxV4lM9hDMvxo/0d02E/1xb666102Ts1nELqp0TbBMPvwVnamH
	2lNfv5ef4syuJzL+kzRD0uGf49ea0aWis8xY7pRK0mNHjsGLJpxW0dtp
X-Gm-Gg: AeBDievjsNjQ1gGVmVCZtm2ylY7VGzU7B9n9sj93HCQSIdvUJQEYGl2aiIgNMMUtasp
	MdqBKXPrbYdOIffMxfX1hWCUk5JzhTds/MObOJZ+S1j49Jn/6+Dagjpecrqw/pEnXqxbcRS+jg6
	LwhwmlUOfmX1ufTEyOMMrHGFm+xdfTiOLwDa16+RJgTUMRtfywdG41/aGVOTjZ6j17XyrC4jYoY
	sG6VuenBK099F5FEsOM5F1nFLAkgzroYMpzHiDj28Tk86XVST1LZxdfjEtOtYsU83jUeBzdaQZ0
	FK4gRt0xA0Wrj6YZF7SLZev9XE37dCUy4aVFisnvXCFL0jfC04UFdQfjCwiBYfnpRrK1lnIsgZN
	iQ6uecqbtQOqach0UW8gsyklcKmMIVHlw6g5osnerz5xr/pOZZMoTwAfpOe8cLJSJWmRBpA5Ryw
	4vC8IG4Gt0qYF+/KB+SdJdn5btaLNLVQWQLNC9+dypMz5G8sy409YWcroEMgr5UFBBLhY0wQ==
X-Received: by 2002:a05:600c:859a:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-48a7b5125f3mr9228125e9.5.1777399603012;
        Tue, 28 Apr 2026 11:06:43 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8cf0fesm3192395e9.5.2026.04.28.11.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 11:06:42 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <b5918621-08d2-4ad6-850f-dda18a1e774d@gmail.com>
Date: Tue, 28 Apr 2026 19:06:40 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
To: Jani Nikula <jani.nikula@linux.intel.com>, akpm@linux-foundation.org,
 ljs@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, masahiroy@kernel.org,
 nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260427174429.779474-1-julianbraha@gmail.com>
 <20260427174429.779474-3-julianbraha@gmail.com>
 <dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <dcb7439832f0bb35598fba653d922b5f6a4d0058@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B69A348A7A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12903-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, 28 Apr 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> Oh, I'd really like a check on this part from kconfig-language.rst:
>
> i.e. warn on selecting visible symbols or symbols with
> dependencies.

Hi Jani,

This is very doable in the general case of unconditional
visibility/non-visibility. Handling the more complex case of conditional
prompts will require finishing the SMT model, coming later.

I'll add this check, hopefully for kconfirm v0.8 / RFC 2 :)

Thanks for the inspiration, and let me know if you have any other ideas,
too.

- Julian Braha

