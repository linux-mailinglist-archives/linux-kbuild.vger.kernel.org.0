Return-Path: <linux-kbuild+bounces-9387-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B38C2DC6A
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 20:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21AB14E765B
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 19:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB714347DD;
	Mon,  3 Nov 2025 19:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V8NgwOiI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929C0DF72;
	Mon,  3 Nov 2025 19:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762196456; cv=none; b=nKvZYPVp9p3W6Ecmbi77NlvGFzxN0DsdnIW/JEmrC/oIYuayF3PAt/7nzauEExU/dhVKzqP8F9/KcNR9br5u1tWUiuL5fI6ul9hi8wNPub65y2GuLWlyu1hQy4hcfuav6+1JJFLKNHI44OKvoqQr++vgt3JGOQG8HJNmo0hsolM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762196456; c=relaxed/simple;
	bh=m12KwopA8lv7W1wwx9gPZ57DhJnLRAi0sftiXYDOV5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgm2tuMojw5UjHs39McHo8+WKuscKmf9iTr9jVFn9CE1VSQ4BxNgKq50H1RG1M0fYdPv409mEhapY1AVV5HDmBgC/x+BKqeJPOwPaIHxfOZwBn9MvQWSmaRFPzpRcW643t5eQpZTaV2QYuAhOBFeZeoIq5KkbALtXU1O33gpPeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V8NgwOiI; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=gq6Go6ACDw07S9koqIFxq6hI6U4ZtqCMXRYZ7gl+vtk=; b=V8NgwOiIL36WQlAL/l+M31eDDL
	Q5aykzJ2GPacLdn62IYywAZXkfZGKuCLPENMdV1Fs60e48Y6Z8C9uV9VkJNqqybrfbcW0Gi0E8Igf
	KGRcUb1ORJuCKS/7A9yWL4f1ypHGW88/h4caUavYN2HOCLF3JTYnNsjRp+1EOMz/mfdjoU310/NdT
	IUiIQnS2Le03DzpyyampoQan/Wa8812tEk3sPMxfq+4GOLhKluNE6D1qE2HVMeHgtSibM1VyzfIi7
	FWR/0MAY+re96GbLcn+tupBEcFMdLq/+LsA2WQUQVBKBjGfhGmifX/jOc9gtGEoqzbn8VWtME6sqQ
	xrkZUViA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFznR-0000000AWLE-0BT5;
	Mon, 03 Nov 2025 19:00:53 +0000
Message-ID: <c0e4a0b0-b7c9-491b-ada3-74945fb2e3d9@infradead.org>
Date: Mon, 3 Nov 2025 11:00:51 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: Let kernel-doc.py use PYTHON3 override
To: Nathan Chancellor <nathan@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 Linux Documentation <linux-doc@vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas.schier@linux.dev>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20251103131419.5e504ae2@endymion> <20251103185609.GB672460@ax162>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251103185609.GB672460@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/3/25 10:56 AM, Nathan Chancellor wrote:
> On Mon, Nov 03, 2025 at 01:14:19PM +0100, Jean Delvare wrote:
>> It is possible to force a specific version of python to be used when
>> building the kernel by passing PYTHON3= on the make command line.
>> However kernel-doc.py is currently called with python3 hard-coded and
>> thus ignores this setting.
>>
>> Use PYTHON3 to call kernel-doc.py so that the desired version of
>> python is used.
>>
>> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> 
> I see one use of KERNELDOC in tools/docs/sphinx-build-wrapper that would
> appear to break with this change? Does it matter? I am not familiar with
> the docs build. Otherwise, this seems like the correct thing to do.

I think there has been some discussion of these matters on the linux-doc
mailing list (adding it here).

>> ---
>>  Makefile |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> --- linux-6.17.orig/Makefile
>> +++ linux-6.17/Makefile
>> @@ -460,7 +460,7 @@ HOSTPKG_CONFIG	= pkg-config
>>  
>>  # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
>>  # has a logic to call it
>> -KERNELDOC       = $(srctree)/scripts/kernel-doc.py
>> +KERNELDOC       = $(PYTHON3) $(srctree)/scripts/kernel-doc.py
>>  export KERNELDOC
>>  
>>  KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
>>
>>
>> -- 
>> Jean Delvare
>> SUSE L3 Support
> 

-- 
~Randy


