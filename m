Return-Path: <linux-kbuild+bounces-10785-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLEoCmt6cWkvHwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10785-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 02:16:27 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70154603BE
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 02:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B3DA4FABEF
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 01:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBC834B1B6;
	Thu, 22 Jan 2026 01:16:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EB830C350;
	Thu, 22 Jan 2026 01:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769044574; cv=none; b=ckIzKjDsrK+qb+e7ZG4vwjkhadvTFZ5zMjcjbEHTqSBgSyy0uSUcEY/O7QOKdxtwgBHTaPuvN1kjbx9RcmKp3i0fCgqtbGy2rx083AjaD+vM1rSFj9N6JLEIXpQVIOo1uvWhnrGWilXUYLUpiNKkxT5ZO9TnS33FTF9OKzafn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769044574; c=relaxed/simple;
	bh=mt4QzWS48/1dqK5pGNjeoDNuDbYTCLIxtoHS3XC9bMI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=dWCGl2FmRNrm+KhZHxCaC1X4w79V/7sLkp54F+ReIygsJPardB6raqv8JRPkz3izUro/+dX8w86hwhs6AJ+r19YGF7tI7KmFH9Zw9LiItzc0Sknu6RqFxiAskYAcsjgiIHtE3NnPzws9n0ZAG1Q2OSaAhP4FhOHpbCDa85UwLas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxPMP5eXFpTl8LAA--.37009S3;
	Thu, 22 Jan 2026 09:14:34 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxPML2eXFpmmYqAA--.17826S3;
	Thu, 22 Jan 2026 09:14:31 +0800 (CST)
Subject: Re: [RFC PATCH 2/3] kbuild: Make sure to generate config file
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260120123730.30487-1-yangtiezhu@loongson.cn>
 <20260120123730.30487-3-yangtiezhu@loongson.cn>
 <20260121234748.GA2137017@ax162>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1bb9876f-cb1f-e088-cb9d-f76032f0d395@loongson.cn>
Date: Thu, 22 Jan 2026 09:14:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260121234748.GA2137017@ax162>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxPML2eXFpmmYqAA--.17826S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxCrWrtw4xCw1UCw15CF47ZFc_yoW5Cr4kpa
	1rAw1UKFn5JF15Aa17K3yrGFy5Ars7tFyUXr17GFyIyr9rtr90yrsFvry3uF1DW395trW0
	qr95Ka4a9a1UtagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1wL05UU
	UUU==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.26 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DMARC_NA(0.00)[loongson.cn];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangtiezhu@loongson.cn,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_FROM(0.00)[bounces-10785-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,loongson.cn:mid,loongson.cn:email]
X-Rspamd-Queue-Id: 70154603BE
X-Rspamd-Action: no action

On 2026/1/22 上午7:47, Nathan Chancellor wrote:
> Hi Tiezhu,
> 
> On Tue, Jan 20, 2026 at 08:37:29PM +0800, Tiezhu Yang wrote:
>> After commit 75cffd392bfa ("LoongArch: Using generic scripts/install.sh
>> in `make install`"), arch/loongarch/boot/install.sh is usually not used,
>> either /root/bin/installkernel or /sbin/installkernel is used if found.
>>
>> Then it can not generate the config file in most cases, just copy it to
>> the installation path. Otherwise there may be an error when testing bpf,
>> for example.
>>
>>    $ ./test_verifier
>>    gzopen /boot/config-6.19.0-rc6: No such file or directorg
> 
> This could also be resolved by enabling CONFIG_IKCONFIG_PROC.

Currently, CONFIG_IKCONFIG_PROC is set by default on LoongArch,
the above error still exists, it checks /boot/config-* first,
here is the related code:

tools/testing/selftests/bpf/unpriv_helpers.c:
static gzFile open_config(void)
{
         struct utsname uts;
         char buf[PATH_MAX];
         gzFile config;

         if (uname(&uts)) {
                 perror("uname");
                 goto config_gz;
         }

         snprintf(buf, sizeof(buf), "/boot/config-%s", uts.release);
         config = gzopen(buf, "rb");
         if (config)
                 return config;
         fprintf(stderr, "gzopen %s: %s\n", buf, strerror(errno));

config_gz:
         config = gzopen("/proc/config.gz", "rb");
         if (!config)
                 perror("gzopen /proc/config.gz");
         return config;
}

>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>   scripts/install.sh | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/scripts/install.sh b/scripts/install.sh
>> index 05d62ac513ee..ecf354d8f4f1 100755
>> --- a/scripts/install.sh
>> +++ b/scripts/install.sh
>> @@ -34,6 +34,12 @@ do
>>   		continue
>>   	fi
>>   
>> +	# Install kernel config file
>> +	if [ -f ${INSTALL_PATH}/config-${KERNELRELEASE} ]; then
>> +	  mv ${INSTALL_PATH}/config-${KERNELRELEASE} ${INSTALL_PATH}/config-${KERNELRELEASE}.old
>> +	fi
>> +	cp .config ${INSTALL_PATH}/config-${KERNELRELEASE}
>> +
> 
> I am a little hesistant to change the generic install logic to handle
> these files, especially since the map file should be handled by
> installkernel like you mention in patch 3 (but I am open to other
> opinions/arguments) and the configuration can be made available via
> CONFIG_IKCONFIG_PROC as I mention above.
> 
> If LoongArch wants this behavior as part of its install process, why not
> just bring back the lines of 75cffd392bfa after $(cmd,install)
> 
> install:
>      $(call cmd,install)
>      $(Q)install -D -m 644 .config $(INSTALL_PATH)/config-$(KERNELRELEASE)
>      $(Q)install -D -m 644 System.map $(INSTALL_PATH)/System.map-$(KERNELRELEASE)
> 
>>   	# installkernel(8) says the parameters are like follows:
>>   	#
>>   	#   installkernel version zImage System.map [directory]

Yes, this works well for LoongArch. If there is no need to do this for
all archs, I will only touch arch/loongarch files.

By the way, I do not know why it can not generate System.map by the
installkernel in practice, could you please check it?

Thanks,
Tiezhu


