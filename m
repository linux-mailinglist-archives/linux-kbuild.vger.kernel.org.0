Return-Path: <linux-kbuild+bounces-12460-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kI2gABpgzGm6SgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12460-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 02:00:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B2B372F7C
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 02:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9EE7301F305
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 00:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF3A1DED42;
	Wed,  1 Apr 2026 00:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cU/qMJoa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822B9184
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775001622; cv=none; b=mr8+Lk4/Q/jyuwpmAaSwTYgcGRCCWo8BbwZPpojxLGgY2J9YacJWTV19mTpkcCWEQdnWbO4SVWaVslYkqdFVrJykmv8H3XjA4bJsHSxvi667/wUDyxwCC30p9k91r00790eIJDzfpGQDFJ/QqUg+upBP2cGM1MRt3kuKVefA2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775001622; c=relaxed/simple;
	bh=6QqvLzfD3TWdX+qJ8LK3qe7rjEasacBys3QoxoGWt80=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=a77i4fdaYZW/oAe08qWqXO8heC+dD01oftpU63IkASsaiSXHSz+r0wgRieBB0ON53pLzGOA2Vzq3D2d7Qy7IEuOJO+FBJREtoNbGDDerIO6iRO3CwB1ARn7IGQU2wJjRLQJz7KEKg0Q/pCI+s8OligAxfQVW3uRseqBgyHmBD/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cU/qMJoa; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d8b2703f37so5809507a34.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775001620; x=1775606420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UvZzRjhIJ24B8/MDQ+5FBw9nmKdExc+6X6xQmVNVp/E=;
        b=cU/qMJoaBSw35D56JZvsbpqDDtcEDkzfeOF1g06j50dT3ApCiH+GP8yQ+GCdbehxnU
         CeSWGPoXBb1FEamaR+cOwyb9w/EAAtSwQYzVGx0LuW95X1BiExk/UwNlDgDkO5Eb12iP
         q/5c57nj5DJnj78z09kk0oPt/e8bU01pYdGYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775001620; x=1775606420;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvZzRjhIJ24B8/MDQ+5FBw9nmKdExc+6X6xQmVNVp/E=;
        b=ExeImmFf1wdXYmZeFVOKGE6zXBFb9R5SonELWo23A7f6S5WdfMu6bSds1FNfp59PGg
         Ti5zop2jHeA0erhvzzt+b23mKi1btQ1tVwdkQrciJvb//IAuEle8DVPyF+WVo+iIqvdn
         6NPlq8xi7iVTs/4IuSvSS9ie7lojAQYwFnmV3FpKQ4mFHS86ZMSgP5OibebrTqh5XvoT
         AoeaPluNLHe4x0OoJKu8fNqRoVmP1mV2N/s01OA451pa8UpdVpk7lBoVReXhnimNo9HO
         YJu61JJH/1SazHYhZ3QWkrVZ728mfXe9aRyeCHttoJi38CzzJDqPcf+YNEBVkgv3Rb5k
         p/zg==
X-Forwarded-Encrypted: i=1; AJvYcCXcDjJgypH0wxNUdht5BnCb8zPZf0OaU/nN9jyhhCZAHkk/AWXQCsJJ9iYERfntlDciNf3JhyL7s7PqKTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YztYNO+FeVmYGRsXGbmYwXJWXaR/bE2ZkkMnA1Ww/BxYaCGsMD/
	xZsCKriTtGBAKzr9JHnULgNIu0zCALwmfXC/kr7vkJNV0ClKCR+m/nxAMP27ck1IZl8=
X-Gm-Gg: ATEYQzxcW245MeX5bj6FmcLrlVEoz9nZE3aV5wIJPokODuo8GjF1CvAi5fGimu3x1cO
	x4dSOJwKcaYD8hf3XBFytJqEbw9fKSIV9ulYkINNYVgPlG2oZbBkSKRQYTsYPLixwyYNnaUezm6
	A7u8v+9DYv2Bt67U2vCf3A59SNcbgYp139orFxYTgOMadOBcEJLOPrBt1tPDF9fpLfpbd5irdGc
	g3JL+orDzY0nqPTJmjC9f1TmvuT8gIm6Ave7czQSv4YcDXX00ZxQblJPCRX55aQWUK0VZiKcN0r
	gfHXBQ3NkzggY5afbUoFIIKSSSxgjLj/IRjEV7fNT1pViFosb6aU1POKem5oKHOFNoPNQEQvqbJ
	GqTpKMncXVFb6qcwTffZ91Gg//FmCc4wnKoRTrEgzeTg+uKesVExX9ehp+zASnDjGDOOocgjuTA
	69T1H4XybWJsXvgU9M6CKgRNhUSJ72OA0Yf5Y=
X-Received: by 2002:a05:6830:6690:b0:7d9:b0d2:dabf with SMTP id 46e09a7af769-7db99393681mr1064455a34.22.1775001620178;
        Tue, 31 Mar 2026 17:00:20 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a336353sm9308937a34.2.2026.03.31.17.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 17:00:19 -0700 (PDT)
Message-ID: <c88cc374-4c06-4567-823f-74dcb92ab90a@linuxfoundation.org>
Date: Tue, 31 Mar 2026 18:00:18 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tools/testing/selftests
To: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
Content-Language: en-US
Cc: Shuah Khan <skhan@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12460-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 59B2B372F7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 15:32, Andrew Morton wrote:
> 
> whinges, perrmanits, maybe I'm doing it wrong, etc.
> 
> a)
> 
> At the top-level, neither `make mrproper' nor `make clean' remove the
> executables from tools/testing/selftests/mm/.  Seems wrong?

make kselftest-all from top level builds the tests
make kselftest builds and runs the default tests.
make kselftest-clean from top level does this.

Also you can run,

make -C tools/testing/selftests/mm clean

As for mrproper support, I just applied a patch that adds kselftest
test to mrproper cleanup to linux kelftest next.

> 
> b)
> 
> Shouldn't I be able to run
> 
> 	make selftests

make kselftest is the one that does that.

Documentation/dev-tools/kselftest.rst documents different ways to
run the tests.

thanks,
-- Shuah

