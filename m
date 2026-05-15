Return-Path: <linux-kbuild+bounces-13164-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Fk5NUsKB2o6rAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13164-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 13:58:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CB654EEC0
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 13:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1646E3020BCD
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 11:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B986D478870;
	Fri, 15 May 2026 11:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="mTpvl2jm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.freenet.de (mout.freenet.de [194.97.204.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577953C9890;
	Fri, 15 May 2026 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.97.204.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844205; cv=none; b=cKDPJQeyzOqEnBlHfu1PEwUj6/r8mcSJgeF3FVAVsQ51cNph3bWPVeVXMUVPEG/gx2sx9gDx8h8kA4h4s6Iu5EriStoTPz7CGK+kAdXgpfM/fTDmQHggyntRe/hp2+PLsTu4Mwgsn4lie1vaBAWBApUWIgNJQTTojK6skSBs7g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844205; c=relaxed/simple;
	bh=qlBgbb0tjrfjIWtFv4FW0wqbSn8/sSFXVp4dR6+K4ZA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gsuUXzf/ls5xIjaVnIpkO5jwQQHECntDA6nT+jPLM/n77Ty6S5psSDvvBrWLcQ0Gj2YoqAr7/55V7gYqEi2UYanbyofnZAU4yCMZny5lkLn94TJLHzAbsybeFyT2a1Vvbpyw8LeCWFIeKNn6YuJSDgya+Wuz+Q15FX+2ds0d7Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de; spf=pass smtp.mailfrom=freenet.de; dkim=pass (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b=mTpvl2jm; arc=none smtp.client-ip=194.97.204.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Received: from [2001:748:400:3319::3] (helo=sub3.mail.fnrz.de)
	by mout5.mail.fnrz.de with esmtpa (ID viktor.jaegerskuepper@freenet.de) (port 25) (Exim 4.98.2 #2)
	id 1wNqYC-00000005Cuj-2UIN;
	Fri, 15 May 2026 13:17:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2UUK6Kx3XTqI38VWhCRPMCYxdNofC3LgCkzTITn/6xE=; b=mTpvl2jmoYNd2Iv6iXR1/RFykS
	H//Tb7AOr8Mi0oPt3LBq94yHfV13GckRevzhiAE5CqaMR9wbzsc1xF9etxjzJNgSJYS4B6+weQvQ1
	3Q+KlG232QPIsEycf2Mp7z4CILMhTAOBVNRlxr1Us9ncMGYGyCRZVRyRAD4jQPUtvXfgTTk++k951
	zinMCcQiA2h/VfSKiSKZau3mqPpBKgl9kRiL21NmApvPWN4i1mYAS/ZNuZ67Oq6M8bEZtajdNU5TN
	7DTKtX7Y+ztemCrELCfFewoLqMXX7ao3k3dAeVrQyg+0sHZecx7TS0De9cIt2c2QRXls/scrXTjU2
	vTpb6fzQ==;
Received: from [2a02:8071:a85:f020:d53c:c75c:80b8:bc12] (port=41342 helo=[127.0.0.1])
	by sub3.mail.fnrz.de with esmtpsa (ID viktor.jaegerskuepper@freenet.de) (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim 4.96 #2)
	id 1wNqYC-00BkWJ-1T;
	Fri, 15 May 2026 13:17:52 +0200
Message-ID: <2fe04523-168b-40d6-bba1-9b1d57939e0d@freenet.de>
Date: Fri, 15 May 2026 13:18:15 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: pacman-pkg: make "rc" releases adhere to pacman
 versioning scheme
Content-Language: en-US
From: =?UTF-8?B?VmlrdG9yIErDpGdlcnNrw7xwcGVy?=
 <viktor_jaegerskuepper@freenet.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Christian Heusel <christian@heusel.eu>, Nicolas Schier <nsc@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513231745.51780-1-viktor_jaegerskuepper@freenet.de>
 <177876476891.305249.12721845256238248028.b4-review@b4>
 <5d5f8ee1-9615-4624-9606-97a6d0943785@freenet.de>
In-Reply-To: <5d5f8ee1-9615-4624-9606-97a6d0943785@freenet.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-FN-MUUID: 17788438723F06932660B2O
X-Scan-TS: Fri, 15 May 2026 13:17:52 +0200
X-Rspamd-Queue-Id: E0CB654EEC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[freenet.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[freenet.de:s=mjaymdexmjqk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13164-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[freenet.de:+];
	FREEMAIL_FROM(0.00)[freenet.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viktor_jaegerskuepper@freenet.de,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sashiko.dev:url,freenet.de:email,freenet.de:mid,freenet.de:dkim]
X-Rspamd-Action: no action

On 5/14/26 23:46, Viktor Jägersküpper wrote:
> On 5/14/26 15:19, Nathan Chancellor wrote:
>> On Thu, 14 May 2026 01:17:29 +0200, Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de> wrote:
>>> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
>>> index 452374d63c24..fe629074b4e8 100644
>>> --- a/scripts/package/PKGBUILD
>>> +++ b/scripts/package/PKGBUILD
>>> @@ -10,7 +10,7 @@ for pkg in $_extrapackages; do
>>>  	pkgname+=("${pkgbase}-${pkg}")
>>>  done
>>>  
>>> -pkgver="${KERNELRELEASE//-/_}"
>>> +pkgver="$(echo "${KERNELRELEASE}" | sed 's/-rc/rc/;s/-/_/g')"
>>
>> Sashiko notes [1] (with a contrived example) that this could result in
>> custom localversions being matched and adjusted. While I don't think it
>> is that big of a deal given how specific the example is, it takes little
>> effort to make the match more restrictive to make such a situation less
>> likely:
>>
>>   pkgver="$(echo "${KERNELRELEASE}" | sed 's/-\(rc[0-9]\+\)/\1/;s/-/_/g')"
>>
>> [1]: https://sashiko.dev/#/patchset/20030
> 
> I agree this is much better. Actually I should have looked at the
> script "mkdebian" for Debian packages which has this line:
> 
> upstream_version=$("${srctree}/scripts/setlocalversion" --no-local "${srctree}" | sed 's/-\(rc[1-9]\)/~\1/')
> 
> This is incorrect for the (hopefully rare) case that we have 10 or more
> "rc" releases, but that can be fixed in another patch.
I was confused, this code for Debian packages should be fine.

Viktor

