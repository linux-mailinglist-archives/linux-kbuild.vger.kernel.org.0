Return-Path: <linux-kbuild+bounces-2055-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D4902DC3
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 02:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19821F2207D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 00:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF354C9B;
	Tue, 11 Jun 2024 00:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="A07ygQak"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8C53AC;
	Tue, 11 Jun 2024 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718067088; cv=none; b=uNeY+rT4WAN8ktdnH9fStMbrIaYi+bM3zgvvahmL0D5QmcetCc1gUd0GqI9wAs71sa9k+V1afMPkICOV2EVW35FTf4W93drLgvJ4qXnBB61B28DoTwz98VAKTeEF16zU9qokg/3YIZ/0Vfg2TrVSD7WfvyGyvmZ/gnrGGr5pSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718067088; c=relaxed/simple;
	bh=QBr40AJn9fqI+J+dUuZ3gW46TDcBqgBa5qK2EmHEnKk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=lICc0597Sw9TM6AgVaB/5iE9sM0H6F1N7WdtcIUTemCHyfQjaf2yBgSFfzc1atRdiuB1CmdHb5qi5T6kLjGRwfRYBWjhGxATWiFbE6KOb8FO1cv4NSgztWUGA8ODIV2XFII4Pv5yPs7wCOkmatrN0BoKoS0k+G6xG96gS9/mVU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=A07ygQak; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1718067083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1AZC16qrNPJTvhkSiuyh/dv6dGmmROqS2dAVeA9wL8=;
	b=A07ygQakwoCeha1mYLy+OM+R+Ga0hgZ1or9zCZ164f5Dk2f8VMy1d7Y98CgN4vBM+/NKZ7
	dVoAJorMBiShe1SXOs5gGkUaEUjGP4lwukIYPk7k+Vg7uIrlW+mHPbztuqFTvBtB5SYHe8
	tBwJO7JFOO6/0uAcK609jTjMZuZ4VCRIjrk4TtDomgPtd9tMRC8MQsH4XdgRITJAEJ7DCj
	d+Qh1PqOpSt8SRF1pzQ5hIv9B6Nx8sJncKPhl5UW2JF8XWPdIp2rZA889Qr21DU6b5IXuV
	bIUFb3WaEdNcVrFy7aqObcEDV35UxxxYMThAbPeUom4H6Qqce2VUlVaHx93EGg==
Date: Tue, 11 Jun 2024 02:51:18 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, Diederik de Haas
 <didi.debian@cknow.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Install dtb files as 0644 in Makefile.dtbinst
In-Reply-To: <CAK7LNAQ7cKbuU9uv67DT4CQagvXdJCWXBP9LjkC_Hvd5QWnYRQ@mail.gmail.com>
References: <e1fd1b659711f59c61ec48dc43912dddccbb4d92.1717996742.git.dsimic@manjaro.org>
 <CAK7LNAQ7cKbuU9uv67DT4CQagvXdJCWXBP9LjkC_Hvd5QWnYRQ@mail.gmail.com>
Message-ID: <15bcfb74bf2f7bc4a5bb481ed23bbf33@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Masahiro,

On 2024-06-11 00:29, Masahiro Yamada wrote:
> On Mon, Jun 10, 2024 at 2:21 PM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> 
>> The compiled dtb files aren't executable, so install them with 0644 as 
>> their
>> permission mode, instead of defaulting to 0755 for the permission mode 
>> and
>> installing them with the executable bits set.
>> 
>> Some Linux distributions, including Debian, [1][2][3] already include 
>> fixes
>> in their kernel package build recipes to change the dtb file 
>> permissions to
>> 0644 in their kernel packages.  These changes, when additionally 
>> propagated
>> into the long-term kernel versions, will allow such distributions to 
>> remove
>> their downstream fixes.
>> 
>> [1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/642
>> [2] https://salsa.debian.org/kernel-team/linux/-/merge_requests/749
>> [3] 
>> https://salsa.debian.org/kernel-team/linux/-/blob/master/debian/rules.real?ref_type=heads#L193
> 
> The 'master' is a moving target.
> 
> The line 193 in the future may not point to the correct position
> 
> I changed it to this.
> 
> [3] 
> https://salsa.debian.org/kernel-team/linux/-/blob/debian/6.8.12-1/debian/rules.real#L193
> 
> This references the line 193 from the 'debian/6.8.12-1' tag.

Good point, it preserves this reference for the future.  The same
thoughts crossed my mind after I sent the patch, but I didn't want
to make noise about it.  Thanks for the fix.

> Applied to linux-kbuild.
> Thanks!

Great, thanks!

>> Cc: Diederik de Haas <didi.debian@cknow.org>
>> Cc: stable@vger.kernel.org
>> Fixes: aefd80307a05 ("kbuild: refactor Makefile.dtbinst more")
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>> 
>> Notes:
>>     Changes in v2:
>>       - Improved the patch description, to include additional details 
>> and
>>         to address the patch submission issues pointed out by Greg K-H 
>> [4]
>>       - No changes were made to the patch itself
>> 
>>     Link to v1: 
>> https://lore.kernel.org/linux-kbuild/ae087ef1715142f606ba6477ace3e4111972cf8b.1717961381.git.dsimic@manjaro.org/T/#u
>> 
>>     [4] 
>> https://lore.kernel.org/linux-kbuild/2024061006-ladylike-paving-a36b@gregkh/
>> 
>>  scripts/Makefile.dtbinst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
>> index 67956f6496a5..9d920419a62c 100644
>> --- a/scripts/Makefile.dtbinst
>> +++ b/scripts/Makefile.dtbinst
>> @@ -17,7 +17,7 @@ include $(srctree)/scripts/Kbuild.include
>>  dst := $(INSTALL_DTBS_PATH)
>> 
>>  quiet_cmd_dtb_install = INSTALL $@
>> -      cmd_dtb_install = install -D $< $@
>> +      cmd_dtb_install = install -D -m 0644 $< $@
>> 
>>  $(dst)/%: $(obj)/%
>>         $(call cmd,dtb_install)

