Return-Path: <linux-kbuild+bounces-11528-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBvHMFV5pmnxQAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11528-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 07:01:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A041E9620
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 07:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE36C3014556
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 06:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E5923183C;
	Tue,  3 Mar 2026 06:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="FmdSp+nW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D129994B;
	Tue,  3 Mar 2026 06:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772517689; cv=none; b=RPbwuB1Qr63MKJZ7+CkaItvJ8lCms2/JN8PeeHJy0tCKSuTjrQSFYk+cMx73vAlIdH/0wOtXKt79K4uz87en/EItAulxgFGqa/ichRf6+C+VDanxQcCmzQTjrmvV6tYwoqR9ByYXtAP+XztIMWDiLjc7XYUQ70uZhOYyaY3Qkvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772517689; c=relaxed/simple;
	bh=qe9P40hHio4C5Hd2euN7jv8j1geM24aYm7G61d59zd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+4qjVZzAZjfpmPHJ85MMipIIVv6rHOqQRIlayi2i/ui1XorYxzH5H+KZ+PgqKX8F4MQZcaJZNhKy9Tkf57R+PaSO2n6KS1XjTbFwfouEU1rYQmb8nvLYUT7I8yMqddYiX7MiNBVcON8IatBUGD6aTTYe8OMQm4Fe7e+auqKwKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=FmdSp+nW; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fQ4ft5NNpz8CMm;
	Tue,  3 Mar 2026 06:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772517078;
	bh=qe9P40hHio4C5Hd2euN7jv8j1geM24aYm7G61d59zd0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FmdSp+nWBMqwAvWybt2drjghQRkFHY6ReZTNUDWjFaG3cnK5ijNRa2j83bCtlbrSl
	 L6uuCyt5sUXgt8ARK2CkBkq6CrWl1GGfpYJDAYfDNXK2BSDHBYSIjlDDlu/meOdztr
	 PqYL8gtQ4YFmdcFf14xCUQqdTCTGPJTUAn476qiZt1aQ4wYf8ttiini2dmFjfWJIp5
	 4SnWyRaLRwF6UbZ1Y5CURK299WtXcHMyyeJBWP5ZC/AT1dMXB/cx9JkA5nKXEuzYhP
	 HCH9hwkrRryXN1tu6fTVCJUUWyFiFWg8zjeFvDh+AHALZ5shq1uRTvvmJmE6YhvUJU
	 144srrwel468A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fQ4ft4gJQz8CMl;
	Tue,  3 Mar 2026 06:51:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fQ4fr5rMyz8t4J;
	Tue,  3 Mar 2026 06:51:15 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CACDA6329E;
	Tue,  3 Mar 2026 06:51:14 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d2fedf99-cae3-4071-b781-d100662a445a@leemhuis.info>
Date: Tue, 3 Mar 2026 06:51:14 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: -next build error due to "kbuild: Leave objtool binary around
 with 'make clean'"
To: Nathan Chancellor <nathan@kernel.org>, =?UTF-8?Q?Michal_Such=C3=A1nek?=
 <msuchanek@suse.de>
Cc: Nicolas Schier <nsc@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rainer Fiebig <jrf@mailbox.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: 
 <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
 <03045f41-fe4c-44ff-b01c-6e325d82255a@leemhuis.info>
 <aaXofbe_5QGYYuMB@kitsune.suse.cz> <20260302204903.GA2007498@ax162>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20260302204903.GA2007498@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177251707521.2147633.2558930100194810901@mxe9fb.netcup.net>
X-NC-CID: 3KNLM+Upkk88ekiWwqt0aw1s4gKdNnbM4Me96bjrHwSdo85vu0M=
X-Rspamd-Queue-Id: 26A041E9620
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	TAGGED_FROM(0.00)[bounces-11528-lists,linux-kbuild=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leemhuis.info:dkim,leemhuis.info:mid];
	DMARC_NA(0.00)[leemhuis.info];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_NEQ_ENVFROM(0.00)[linux@leemhuis.info,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 21:49, Nathan Chancellor wrote:
> On Mon, Mar 02, 2026 at 08:43:57PM +0100, Michal Suchánek wrote:
>> On Mon, Mar 02, 2026 at 08:18:17PM +0100, Thorsten Leemhuis wrote:
>>> On 2/28/26 06:40, Nathan Chancellor wrote:
>>>> The difference between 'make clean' and 'make mrproper' is documented in
>>>> 'make help' as:
>>> [...]
>>> Thx for fixing this regression, sadly this caused my daily -next rpm
>>> builds for Fedora to fail on x86_64 during a "make mrproper":
>>>
>>> ""
>>> kernel.spec:2485: InitBuildVars: Copy files
>>> + /usr/bin/make -s 'HOSTCFLAGS=-O2  -fexceptions -g -grecord-gcc-switches -pipe -Wall -Werror=format-security -Wp,-U_FORTIFY_SOURCE,-D_FORTIFY_SOURCE=3 -Wp,-D_GLIBCXX_ASSERTIONS -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -fstack-protector-strong -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -m64 -march=x86-64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection -mtls-dialect=gnu2   ' 'HOSTLDFLAGS=-Wl,-z,relro -Wl,--as-needed  -Wl,-z,pack-relative-relocs -Wl,-z,now -specs=/usr/lib/rpm/redhat/redhat-hardened-ld -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1  -Wl,--build-id=sha1 -specs=/usr/lib/rpm/redhat/redhat-package-notes ' -j32 mrproper
>>> find: cannot delete ‘/builddir/build/BUILD/kernel-7.0.0-build/kernel-next-20260302/linux-7.0.0-0.0.next.20260302.121.vanilla.fc42.x86_64/tools/objtool/.check.o.cmd’: No such file or directory
>>> find: cannot delete ‘/builddir/build/BUILD/kernel-7.0.0-build/kernel-next-20260302/linux-7.0.0-0.0.next.20260302.121.vanilla.fc42.x86_64/tools/objtool/.elf.o.cmd’: No such file or directory
>>> [and many more like these]
>>> ""
>>> For the full build log, see:
>>> https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/next/fedora-42-x86_64/10183736-next-next-all/builder-live.log.gz
> [...]
>> Or does the objtool_clean run multiple times in parallel, once through
>> the clean target, and once as dependency of the mrproper target?
> 
> More than likely this based on my reading of the submake processes from
> the build log. For what it's worth, I cannot reproduce this error on
> either a really fast or really slow build machine but it should not be
> hard to avoid by using 'xargs rm -f' like the rest of Kbuild does for
> removing things, which should suppress the error if the file does not
> exist. Thorsten, could you see if this diff makes a difference for you?

Yeah, that makes things work again, thx!

> If so, I'll squash it in with a note.

Great, thx!

Ciao, Thorsten

> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 50d3e38e6137..76bcd4e85de3 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -142,7 +142,7 @@ $(LIBSUBCMD)-clean:
>  	$(Q)$(RM) -r -- $(LIBSUBCMD_OUTPUT)
>  
>  clean: $(LIBSUBCMD)-clean
> -	$(Q)find $(OUTPUT) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
> +	$(Q)find $(OUTPUT) \( -name '*.o' -o -name '\.*.cmd' -o -name '\.*.d' \) -type f -print | xargs $(RM)
>  	$(Q)$(RM) $(OUTPUT)arch/x86/lib/cpu-feature-names.c $(OUTPUT)fixdep
>  	$(Q)$(RM) $(OUTPUT)arch/x86/lib/inat-tables.c $(OUTPUT)fixdep
>  	$(Q)$(RM) -- $(OUTPUT)FEATURE-DUMP.objtool


