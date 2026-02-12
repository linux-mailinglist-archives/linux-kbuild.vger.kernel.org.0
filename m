Return-Path: <linux-kbuild+bounces-11294-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8qhLL/opjmlsAQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11294-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 20:28:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0916D130B14
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 20:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EC243024A70
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 19:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471DB27B340;
	Thu, 12 Feb 2026 19:28:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0.herbolt.com (mx0.herbolt.com [5.59.97.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0EE1643B
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Feb 2026 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.59.97.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770924535; cv=none; b=Bs4bW1aEQaSvwtVZ7T3+Jun7/OyNKLY7OqPzWM5aeFn6RtUlqYTNOeB2sKK1FUXq/mO1szBv25SfZaK9fxaf63RDHV/rjthzquWK6Xkiw8D0PFdS2K8T9zwOfuDoAiy98ur//sxIAnwqgpE1SpL5K3V7k1hF3mqvbDGJXTnJDXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770924535; c=relaxed/simple;
	bh=C69yzeRKxrkv/0DLvNhrJAzYO2wiWbrv0dAg0DbtJZk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Z9XDwXIsIJHU5vLJN0bm9e8ZBCtatqyo2Ld/DLLG0uUFX02ZNxT1HLivH8ytOFI+eXpzse0btDEVB4TW/3U54oQP5nmm4mc74LMc9UC1oGHkL7KFy3dlv3QCQb8fEKRqpwJGHw2LVmf/AS4nkOJf5wp7v8/02+ytQD6ZqcUV15I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herbolt.com; spf=pass smtp.mailfrom=herbolt.com; arc=none smtp.client-ip=5.59.97.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herbolt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herbolt.com
Received: from mx0.herbolt.com (localhost [127.0.0.1])
	by mx0.herbolt.com (Postfix) with ESMTP id 31F7C180F2D5;
	Thu, 12 Feb 2026 20:28:46 +0100 (CET)
Received: from mail.herbolt.com ([172.168.31.10])
	by mx0.herbolt.com with ESMTPSA
	id YsrZA+4pjmkkpQEAKEJqOA
	(envelope-from <lukas@herbolt.com>); Thu, 12 Feb 2026 20:28:46 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Feb 2026 20:28:46 +0100
From: Lukas Herbolt <lukas@herbolt.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: rpm-pkg: Fix generating debuginfo manually.
In-Reply-To: <20260212162643.GB802926@ax162>
References: <20260212135855.147906-2-lukas@herbolt.com>
 <20260212162643.GB802926@ax162>
Message-ID: <8c9a0d167e463c4e6275a77cf7980e28@herbolt.com>
X-Sender: lukas@herbolt.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11294-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[herbolt.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@herbolt.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0916D130B14
X-Rspamd-Action: no action

On 2026-02-12 17:26, Nathan Chancellor wrote:
> Hi Lukas,
> 
> Thanks for the patch!
> 
> On Thu, Feb 12, 2026 at 02:58:56PM +0100, Lukas Herbolt wrote:
>> The ${OBJCOPY} and ${READELF} are not expanded into path to readelf
>> and objcopy binary so just use the binary name with the %{_bindir}
>> makro.
>> 
>> Signed-off-by: Lukas Herbolt <lukas@herbolt.com>
>> ---
>>  scripts/package/kernel.spec | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
>> index 0f1c8de1bd95..d032f6aff91b 100644
>> --- a/scripts/package/kernel.spec
>> +++ b/scripts/package/kernel.spec
>> @@ -109,11 +109,11 @@ echo 
>> /usr/lib/debug/lib/modules/%{KERNELRELEASE}/vmlinux > 
>> %{buildroot}/debuginf
>>  while read -r mod; do
>>  	mod="${mod%.o}.ko"
>>  
>> 	dbg="%{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}/kernel/${mod}"
>> -	buildid=$("${READELF}" -n "${mod}" | sed -n 's@^.*Build ID: 
>> \(..\)\(.*\)@\1/\2@p')
>> +	buildid=$(%{_bindir}/eu-readelf -n "${mod}" | sed -n 's@^.*Build ID: 
>> \(..\)\(.*\)@\1/\2@p')
> 
> When using the binrpm-pkg target within Kbuild, I do see these expanded
> to their Kbuild value:
> 
>   ++ .../toolchains/gcc/15.2.0/bin/x86_64-linux-readelf -n 
> net/ipv6/netfilter/nf_reject_ipv6.ko
>   ++ sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p'
> 
> but I guess use of the spec file is not limited to being within Kbuild?
> How are you using it? I guess using the srcrpm-pkg and building it
> manually?

Yes exactly; make srcrpm-pkg and then mock --rebuild <src.rpm> (which 
actually
runs rpmbuild in chroot).
Looking into it I guess the variables should be expanded after the make
srcrpm-pkg, but if I check the spec file:

I can see:
buildid=$("${READELF}" ....

So the mkspec is not expanding the variable.

> 
> I would prefer to keep use of these variables so that the user's choice
> of toolchain is properly respected. The proper way to fix this is 
> likely
> using a fallback only when the variable is not defined. Does this work
> for your usecase?
> 
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 0f1c8de1bd95..c23ff98f63ed 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -109,11 +109,11 @@ echo 
> /usr/lib/debug/lib/modules/%{KERNELRELEASE}/vmlinux > 
> %{buildroot}/debuginf
>  while read -r mod; do
>  	mod="${mod%.o}.ko"
>  
> 	dbg="%{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}/kernel/${mod}"
> -	buildid=$("${READELF}" -n "${mod}" | sed -n 's@^.*Build ID: 
> \(..\)\(.*\)@\1/\2@p')
> +	buildid=$("${READELF:-readelf}" -n "${mod}" | sed -n 's@^.*Build ID: 
> \(..\)\(.*\)@\1/\2@p')
>  	link="%{buildroot}/usr/lib/debug/.build-id/${buildid}.debug"
> 
>  	mkdir -p "${dbg%/*}" "${link%/*}"
> -	"${OBJCOPY}" --only-keep-debug "${mod}" "${dbg}"
> +	"${OBJCOPY:-objcopy}" --only-keep-debug "${mod}" "${dbg}"
>  	ln -sf --relative "${dbg}" "${link}"
> 
>  	echo "${dbg#%{buildroot}}" >> %{buildroot}/debuginfo.list

Yeah that works for me.
-- 
-lhe

