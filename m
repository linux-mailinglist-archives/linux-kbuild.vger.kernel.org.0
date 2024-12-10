Return-Path: <linux-kbuild+bounces-5063-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A2B9EAF58
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 12:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E424F161DFC
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 11:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3EE223321;
	Tue, 10 Dec 2024 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=limbasan.ro header.i=@limbasan.ro header.b="XzKGBomk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3542343B0
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Dec 2024 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828882; cv=none; b=pwY2CTIftt87FWikDirbUk/12UAik94pdpkAUUX4KyL1id8LiA9ZrWUI4patf/yKLLGlVGltLKfi24L+2FREY0v0iNOl1SBjecanQw8YzUrKMDv3nwao7buro3GK9Oj4SczlhZpEmUDZ7GNvdcXWVL7Kh8DXrOeQWkvF/dGUwcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828882; c=relaxed/simple;
	bh=tbI2I94h9b41Vvg+5hSSOshlLX89A34VcY1oKZvNvB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qj68zDnqSIcSX0e1ESFsgmqeDbeU1pqF3BtJvnfsENyQvnviUfcVIOuVExvxp91Ri6I2r5kRDWbGJ+xcDbju/hJTT1y/oSCjnd1pjuxRERT4lSk8KBPYRADM7fOeySichzfVjtimrmZ2N4hDHVAklopfaD1WmyIu731axlYngx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=limbasan.ro; spf=pass smtp.mailfrom=limbasan.ro; dkim=pass (2048-bit key) header.d=limbasan.ro header.i=@limbasan.ro header.b=XzKGBomk; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=limbasan.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=limbasan.ro
Message-ID: <9b87eed3-4b6e-4a2a-88c6-db56c043c9fe@limbasan.ro>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=limbasan.ro; s=key1;
	t=1733828876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qN999n5J2JtGb1A6zWRT81zX6ry/IlSKQ7y4eYsgdoc=;
	b=XzKGBomkHsG85OhM9i/LDYwkRFcZDUvbaKpOy1joL6SboG6En7y23dZXRxLnlQe6vOBMcr
	/EIJu4wy6yF5XRGueMMxnF+r5Jm42SJE8udWG/kQwD9XJEAmuI+kGcbGSSW9zsUW3joivA
	09/epKUJWg5Q2m1LyoKVO29kq8zbgcatVb/jD9qTGXuqdNV9r2nkIhuT1hrwQ4yLqzsXbF
	SKPASAE/pcM0sS4vAHKg91kGRwkO8D04ZkoYa9hR+LT7e3thHSUrPZHRMUF0WB+5J2k/5g
	kwTUWDgXuGZHE5bqBXYXzdv4DCfEu9OP1Igmo6icdUQ81q6qcUWqk6H3tE8h9g==
Date: Tue, 10 Dec 2024 13:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [Bug] 6.12+ DKMS modsign breakage due to missing .config in
 Debian headers package
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
References: <b7bb8d16-2d05-43b5-95fc-7d303b925f44@limbasan.ro>
 <CAK7LNARHWcHiXPWxRD804vO6hF5H06kgBho-EXSa1f8eiPj5rQ@mail.gmail.com>
Content-Language: en-US, ro, de-DE
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?UTF-8?Q?Mihai_Limb=C4=83=C8=99an?= <mihai@limbasan.ro>
In-Reply-To: <CAK7LNARHWcHiXPWxRD804vO6hF5H06kgBho-EXSa1f8eiPj5rQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi!

On 2024-12-10 12:45, Masahiro Yamada wrote:
> On Mon, Dec 9, 2024 at 5:31 PM Mihai Limbășan <mihai@limbasan.ro> wrote:
>> Hi!
>>
>> Would like to report a DKMS build system impacting bug with kernel 6.12+
>> introduced in commit aaed5c7739be81ebdd6008aedc8befd98c88e67a . Hope I'm
>> addressing this following proper protocol by mailing linux-kbuild, tried
>> mailing the maintainer directly on 2024-11-20 but received no feedback;
>> my apologies otherwise, it's my first kernel bug report.
> Sorry, I missed that.
>
> Before you, another guy asked me the same question off-list.
> Multiple people contacted me off-list for the same question.
>
> Presumably, asking this in the ML is better because
> other people may find the answer and avoid duplicated questions.
Oh my, not a problem. Initially approached directly to avoid potentially 
bugging a lot of unrelated people, but you're absolutely right, easier 
to find this way. Thank you!

>> Specifically, the commit changes scripts/package/install-extmod-build to
>> remove the shipped copy of the kernel configuration as .config in the
>> generated package. Unfortunately, this breaks DKMS when secure boot is
>> being used and any locally compiled the modules need to be signed. DKMS
>> needs it to extract various characteristics of the built kernel, among
>> which CONFIG_MODULE_SIG_HASH so that it can sign the .ko files it
>> creates. It's likely that it also uses various other symbols from the
>> kernel config, e.g. clang-related stuff, but I didn't test that.
>>
>> The removal of the other formerly shipped files doesn't appear to cause
>> any problems, at least not in this scenario.
> I do not think removal of the .config is a problem because
> another copy, include/config/auto.conf exists in the package.
>
> DKMS can parse "${kernel_source_dir}/include/config/auto.conf
> for CONFIG options.
True. The problem I see with  with that is that it unexpectedly breaks 
the current behavior (even though admittedly there never was a formal 
API contract in place) and requires an update to DKMS across *all* 
distributions. I'll report a bug to upstream DKMS to this effect, but it 
might take a long time to fix this, and many distros will likely not 
backport a future DKMS fix to current or older-but-still-supported 
versions, whereas re-including .config in the kernel headers package at 
the cost of a 200-300kb .config copy would not let users of the mainline 
kernel hanging, *and* would minimize the surprise factor.

 From my testing, things seem to work perfectly well when creating a 
relative symlink from "${kernel_source_dir}/.config" to 
"include/config/auto.conf" -- maybe this could be a compromise solution? 
It'd avoid shipping the extra noise from the full .config while at the 
same time avoid breaking already-shipped DKMS versions.

Mind you, it's not like it's a big deal for me personally. It's just 
that the behavior of the system as a whole with this issue in place is 
thoroughly unintuitive: DKMS does *not* report an error nor does it fail 
OOT module build. From an user point of view, what happens are problems 
on the next system boot (potentially boot failure, depending on what 
failure to load the OOT modules does), with module load failure messages 
that initially give no clue as to the root cause. And since the use case 
for DKMS here is *exactly* a set-and-forget approach to OOT module 
building, it can take a *while* before people think to check the build 
logs (if they even keep them) and somehow figure out that "Kernel config 
${kernel_config} not found, modules won't be signed" means "upstream 
changed the kernel headers package semantics".

Thanks,
Mihai

