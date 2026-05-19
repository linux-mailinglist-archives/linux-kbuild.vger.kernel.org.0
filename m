Return-Path: <linux-kbuild+bounces-13267-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPUbLQmqC2oGKwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13267-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 02:08:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 357D6575645
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 02:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A12A301DD99
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 00:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BE92F84F;
	Tue, 19 May 2026 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVdrIvjD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629382E401;
	Tue, 19 May 2026 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779149317; cv=none; b=MfuovVHXGPj/KiFAo4Otme0hl6Lp+E+LpJLmXVXIRbuVAFDDc0pWhxBEX19yG2dpRew/mvRE8aoS4HTRrJvzugedSWZl3JousGWpKTq7tgLshgfsSZNEtx6NSkc6EqFWryMeF0bl2hTou4oZmifbr1jcfaJyHaALC1jc2i5irt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779149317; c=relaxed/simple;
	bh=+9+uNacg7sL48NCRYmRVSwKNtI/VXn58tJHaBAVbmGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PbrA0e+cmbGZ5235/4ejdjQWNvbw/P1Txd70p4anyeO43R9wOQRONSc69lyNYzf6RRjt5B66DOjo4f1ik4Wr559bp/cQakqMUSdMSC68y1RX7baHH2ET3OvkruVQVQlikR2QmzG4g5ceK0kkYddu7CvXX61KiQzQhB5obx9NXmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVdrIvjD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BBAC2BCB7;
	Tue, 19 May 2026 00:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779149317;
	bh=+9+uNacg7sL48NCRYmRVSwKNtI/VXn58tJHaBAVbmGA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=jVdrIvjDz957CRbAt6yGvNaKATa12/0KFfFTH7+GfZvw7kiAeI9o9ek/dx/ihcg3F
	 RHRUDlwqzU76Pm1MOR4bfsewZUSZMpEqYe8yDW0l1Y1/VTPqjyHJejtpl59FUk5fiu
	 x6cwD6FjIq+6Rx3QoYB7+nydVNtVBnKqxWL3UOAhhvG/lD8FEmONChN1eHbnxSTeFq
	 992D+z8eERpnRpOlnnV7BBkLoGKS5qw89PBKyH6enIzsXsAJN3UfvT8M5EyNMjSLLV
	 LypXIKUuodhRIM7EuBXxweIdAviLCMmLca0AwvTOEVrFqwOTHZtTRq1LkaMcNCiB8Z
	 wfgfCwu+7wVwg==
Message-ID: <88a87ebb-79d2-470d-8158-1469c05a04b3@kernel.org>
Date: Mon, 18 May 2026 19:08:35 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: deb-pkg: Allow setting package name at build
Content-Language: en-US
To: mario.limonciello@amd.com, nathan@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260505152957.695641-1-superm1@kernel.org>
 <aglm3IFmnCPInJqH@levanger>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <aglm3IFmnCPInJqH@levanger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13267-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 357D6575645
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/26 01:57, Nicolas Schier wrote:
> On Tue, May 05, 2026 at 10:29:54AM -0500, Mario Limonciello (AMD) wrote:
>> Users can change the source package by setting variable `KDEB_SOURCENAME`,
>> but the binary package name is hardcoded.
>>
>> Add support for setting binary package name by using `KDEB_PACKAGENAME`
>> and let it affect both kernel image and debug image packages.
>>
>> Update kbuild documentation to include defaults and mention both
>> `KDEB_PACKAGENAME` and `KDEB_SOURCENAME`.
>>
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   Documentation/kbuild/kbuild.rst | 10 ++++++++++
>>   scripts/package/mkdebian        |  6 ++++--
>>   2 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
>> index 5a9013bacfb75..cbdd2224c3a55 100644
>> --- a/Documentation/kbuild/kbuild.rst
>> +++ b/Documentation/kbuild/kbuild.rst
>> @@ -177,6 +177,16 @@ the UTS_MACHINE variable, and on some architectures also the kernel config.
>>   The value of KBUILD_DEBARCH is assumed (not checked) to be a valid Debian
>>   architecture.
>>   
>> +KDEB_SOURCENAME
>> +----------------
>> +For the deb-pkg target, allows overriding the default source package name.
>> +The default package name is "linux-upstream".
>> +
>> +KDEB_PACKAGENAME
>> +----------------
>> +For the deb-pkg target, allows overriding the default binary package name.
>> +The default package name is "linux-image".
> 
> Do you see a real need for that?  (We should prevent adding
> complexity when it's not neccessary.)
> 
>> +
>>   KDOCFLAGS
>>   ---------
>>   Specify extra (warning/error) flags for kernel-doc checks during the build,
>> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
>> index d4b007b38a475..cbe4266fac732 100755
>> --- a/scripts/package/mkdebian
>> +++ b/scripts/package/mkdebian
>> @@ -166,7 +166,9 @@ else
>>   fi
>>   sourcename=${KDEB_SOURCENAME:-linux-upstream}
>>   
>> -if [ "$ARCH" = "um" ] ; then
>> +if [ "${KDEB_PACKAGENAME:+set}" ]; then
>> +	packagename=$KDEB_PACKAGENAME
>> +elif [ "$ARCH" = "um" ]; then
>>   	packagename=user-mode-linux
>>   else
>>   	packagename=linux-image
>> @@ -252,7 +254,7 @@ fi
>>   if is_enabled CONFIG_DEBUG_INFO; then
>>   cat <<EOF >> debian/control
>>   
>> -Package: linux-image-${KERNELRELEASE}-dbg
>> +Package: $packagename-${KERNELRELEASE}-dbg
>>   Section: debug
>>   Architecture: $debarch
>>   Build-Profiles: <!pkg.${sourcename}.nokerneldbg>
>> -- 
>> 2.53.0
>>
> 
> Did you test that patch?
> 
> These changes are not enough, as scripts/package/builddeb does not pick
> up the non-standard binary package name in its final 'case', and thus,
> _no_ binary package will be generated if KDEB_PACKAGENAME !=
> "linux-image".
> 
> Kind regards,
> Nicolas

Apparently I didn't test effectively beyond making sure it built and 
didn't introspect the build log closely enough.  Sorry about that!

Let me explain the background of what I was looking to do here.

The changing a package name was mostly so that I could sync up the 
source package and binary package names.

So I could (for example) upload a source package from a given tree to a 
PPA and then the PPA would build binary packages.

I could then upload a source package for another tree and let the same 
PPA build the binary packages for it.

If you have the same binary package name for both packages then you need 
to do some git archaeology to figure out which hashes go with which 
trees.  Or you can look at PPA build logs and figure it out.

Both of those methods are a lot of work for what I thought could be done 
pretty easily with a variable to differentiate.

This would allow easily cross referencing a test result between two 
different trees.



