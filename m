Return-Path: <linux-kbuild+bounces-13117-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC7RCqnYAWpMlQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13117-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 15:24:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC5150ED55
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 15:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 492C5302A739
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 13:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044CB3E5EC0;
	Mon, 11 May 2026 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCPmQUpf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9AA3E5EF0
	for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2026 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505539; cv=none; b=oj2w26dOaO3Q/5epRZHJ4oEc/XwxwIFukmFaJb70s0uaxB6bcjiMxe9c1OvjFE/fU/oV3Merl7a3bmZ8MsPKzmLOSmQ+HqbLjuuWv/fI65a+ocSf/YPKBMlLQt9n6CmVeIjKOllESdBUmEUpnAtwM7K+B7n3ymuQ2vYXnmjt7EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505539; c=relaxed/simple;
	bh=aFKpLXhtgadBepER+jv213UmH+cx7dVrSbjQrlKsbLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfJVLal6sciFmbU7Q+F2DEnTe0oBURAfi09yUQFUad+c/ahIIB5iYBa/umf2kW6e37viwv+XhvCN4HumWZrOsp6UyZI/2JSxsjbADpbgG13EiAQB6sVGNkausddFW/s8KizL+sPKXYQpyxgvfYSWcH6lQJDppo1iDTWBrdqUe80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCPmQUpf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b150559bso33431245e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 11 May 2026 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778505537; x=1779110337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=g/gsIqss6ka1gkZNbEHINXe4X7NBBNbHnrb2ir7Oq5U=;
        b=cCPmQUpfxONz5lgCLItoo6WlxwgkWI5ljm9u/5FSEzSFqgp+wSBUZS6Kz7hmMiONiv
         Q8g+RWMd2dt8+Bgqc24H7aSt3ST25KwwBsfPxdN6S29TKRJRGGMR4VpYqoQik0EhNKe3
         6M3Lk0bN+ucyrzFdi2v8/iTkuNKmRfTQ7oAwrOcGeGgRM1G69qWjWOAm8GAYVpM0sqkw
         GExThRNxDAccoGa/SF0Fa8apM+j9CCpOpiCJRWolk2iqHLTeZcRhgR0XrhJD1FXKbdGV
         HfoOFHHmocpUJ8AcKctOG3lPwr1TIWohwFgtw8mqQZP5GS8wrlN7n693ekByuPYRyWWR
         EDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505537; x=1779110337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/gsIqss6ka1gkZNbEHINXe4X7NBBNbHnrb2ir7Oq5U=;
        b=d7NnI243laqrtlCGG9WFWVQcU5hyoRQDqP2OnOHd198irf24IrpuLwH59XuOoEH8K9
         Ka9cTP5MGRURLgHJXGhC834ePNDJ/RgBgbCktFj7YtgsZHie+le/U+dRx5sxsoebLwXD
         kvQaMhkF63SptYHt0PcQUZbqDmz+0jWq1+tb6YoKXbnphzGEUrMOv86zA2yBvP4C3FKo
         OB3C5bKrM09cWrYm9+d4cEaWZWkDj/sj8XwcnxXF8P2RaEGi4/yVQx3xPUQV9EzXc3h9
         /A8gFNy1PMQa+cRcFSU+s1USzNoMtus/4LvR3d96MBDlbCkoQGQtvAVUpBx80aKZR3LX
         Qb5A==
X-Forwarded-Encrypted: i=1; AFNElJ/5NePR0x4pUFUmlSmulpqzPc9cp9s81BS37JkFulw0vy6CDJQFKkpJCF/zLuoLgWFbR6/4EqB5nYWP2I4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlKjL/N31DI2K8xgr3jW23pp+HeUfNxGm2xMYvYKny/dZ8YSE
	kIBpy5l+4XwDsNNiToGvYRbEIR05+UQxryVgJbHxxn8ot8nDSAopZs7i
X-Gm-Gg: Acq92OFnOK8tYSDdILjmCbOWsIXfWyUkMMneGygdScea57pIypLngIxizwi1aU5Js0M
	baNtNN21HJ/45AoxlCBF8HbVbkLfMhwbl7wyn5EPRYZZLiEiG7jHmXL/cV2CC+cdpAzuXX6yEMy
	bgEFeWN+HqAXwDarLJak4WDA4FKBwiGFaaSEBOTk38jDUJ7ExpYNKLZsLXaMK5mFDiC8Vb+qNYm
	vjR5y/YXvCPM88g9qji8MccpDzgxNjkA73giIPj1MejR5tSZTzJrB3W1j3E4BjCTZeQkhwutSPa
	dR+dFnpkJq9yhX4pQGV8vnfEKcEMuKD4qZJKZFUnhl9892AxHSa6n15hKX3c+pkAdVAOY4aRt+E
	fJLNTnLzi+eEP6h5IwRiuWk4144vMuwI7AKevEBLAfPbMCCdtyloNFiSK2QOJPxYRdG92DAmkfJ
	IZUTjCvrXVi7Uy/JbIxpK5GWa5unnp9wsD8p7q2UZSohyQVf2e3G9qNKqnSOa86WhdBHjDmg==
X-Received: by 2002:a05:600c:5306:b0:48e:526e:101a with SMTP id 5b1f17b1804b1-48e706c781emr158001255e9.12.1778505536621;
        Mon, 11 May 2026 06:18:56 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702ec426sm178326055e9.10.2026.05.11.06.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 06:18:56 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <0f65dcac-7c5c-4bbf-be2c-b1cd68c7697a@gmail.com>
Date: Mon, 11 May 2026 14:18:54 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] scripts: add kconfirm
To: Jani Nikula <jani.nikula@linux.intel.com>, nathan@kernel.org,
 nsc@kernel.org
Cc: akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, masahiroy@kernel.org,
 ojeda@kernel.org, corbet@lwn.net, qingfang.deng@linux.dev,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <20260509203808.1142311-2-julianbraha@gmail.com>
 <4579a61db0975b967e8063661be77bb439283fd7@intel.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <4579a61db0975b967e8063661be77bb439283fd7@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3DC5150ED55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13117-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/11/26 10:57, Jani Nikula wrote:
>>  scripts/kconfirm/LICENSE                      | 339 +++++++++
> Why?
> 
> See LICENSES/preferred/GPL-2.0.

Sorry, that's an accidental artifact of the tool's current setup as an
open source repo on GitHub. The tool code itself has the expected SPDX
identifiers. I think I need to write a small script for preparing these
patch set submissions. Thanks for your attention on these RFCs.

- Julian Braha

