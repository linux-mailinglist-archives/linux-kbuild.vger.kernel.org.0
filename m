Return-Path: <linux-kbuild+bounces-11547-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGrCMmDlp2mrlAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11547-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 08:55:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 720841FC055
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 08:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 941B83049566
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2026 07:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06180390993;
	Wed,  4 Mar 2026 07:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FNnTPrmD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E50538657B
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Mar 2026 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610753; cv=none; b=NeIC+Ay2wt9r9yZRU/kSIY51k18wny35wBlnBta4u5Ff96WQhZeN8Drl+qgn/rwyTy2UXQV0roY3GO+kKu354irC20VoXcuDhukxlIyTymnx7ZNov/gwnhH2BhC1YJBQxhyCe9QC9t6J3EIK1MyHNX2DJ7T1M74z2Zn4rdJpRJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610753; c=relaxed/simple;
	bh=EcLDMvBjjbTD/cKF5y1BkO7ob6e6OBIu3jcREkFicZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMUoCN6Mm61b6KGRZREYTaHGQSRel9sAvZMPmhJYOMpSpj6tplbaJLipj71emedTaLx6LljJnuSjFWcy2xhsu7zJnRcJJQr5raMgZjIG4J9vKq/STPj03xyMnznrYH4XA9bHJC/xIQFNwG4Np4yv58EyO6AWERkX4C9RwFoO7wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FNnTPrmD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439af7d77f0so3147992f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Mar 2026 23:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772610748; x=1773215548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iaji8MiSwOMoEhpHJ9TfGIIdRoqWhERpR7BNI+IYVW8=;
        b=FNnTPrmDvPeJsl7KgOkZBHjigGbAfeWKOyNkXPj/ux+4SYrQn4MTPSHMrouYmSgqIa
         YuFUNmIKbBGjpl8HC4GdNNkeY3ChhyRlnRpH4V0ri52oDep3hlSTOoliQedMT0Q80eJ/
         u74NOjzU2/l3poPflXJgxfZbtt5Jd1H9iW1nzjA/GbFpj7Don+kWtej1SpQqfk5AYi09
         Eb9dLae/TK4h5q3fJZKI1g95C/udZxLAoLe0Upb2/LygfKo5T5+smDUdi37tfQZDsldY
         1va/Z7NSVaRop+Elt1Nxco58Kr4VF80cTnrvUk2M/x5YabCEcP0q7FV2F+ubPjbxO5dH
         6ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772610748; x=1773215548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaji8MiSwOMoEhpHJ9TfGIIdRoqWhERpR7BNI+IYVW8=;
        b=XATxIxnXppWRpx9/tqrN3R7q3yCRfU9GWXmiCEsn3ENMraH7zNreOP13S+PVYnUlqX
         9PYsI4zqoHHhmwywccYJNCtdkelO5odINXcTQ4Oo9cVj9B4ar5H6jGrXVAxoCN0h8DVI
         2VCUOHPXxmk/KQPLBJJXTUMxWYN40wjMOBIzKvX6I6KhmL+N50WJ47hrfig51e4f3YAH
         vtUgxdAoSNnHzTu8lj51P3dcAY3yHsDEIRUve1sxThluApsAIfEn1Lsr21Zo1oKte5qw
         Uwd2YCaM830igLNAudWgkAWzZy5FZ46xRll6/AJf1AdC6WE3D+SULHp5rTAuSKqpQUgQ
         fK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXy9aGu8NkMJtvfLo6iyUb/89bqk2SVZW6n6r9zY+u1XFkInpOmoGT+ebkaxnez3VfeMLBjJ78d8jr5aVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2WsEc4NAPENaG3AEqy+N1+f+/lM7JhCazXToPDLBchIuUgeYQ
	192EDpzd0/5nOFlWvqBWTN3J1BP7R8Nd9IRehEJyW8TD61hXDytG0jajh7VhlMhDGck=
X-Gm-Gg: ATEYQzwQCOsAwtHso0e0eC+hjnLt/jwv/UbqSNT7FNjXmSfDv+z8b2EThUt6fnjSjJ3
	0vaim5v8VxbMhaoepHeAuBazQ1k/c+jE/wuY5asHU5whnTwqDahL/1MFhw3gs4LY0HD7JboCXf9
	Fi2FwVtqg99C6h/jnJ9YolCKAXyisrAEeTMNsHCH22kS1OUUojoqIrCQnrBdxWC2wp3SX+8yWD5
	kadipLwDYROxe42Iae6cdYGOvq/Q/ZB/u6WMKjYBhkrS2MsijpZ3L/TilXBU3xreFBCFo3dfK/u
	+cgXGmmJEXKyxXlmeEpmRodHMSNc7bFkjsvBgviJqPkn+NKeWta9epvGvmrJ+4OVveycjxMWpls
	40HZ5V5wgVsQK9IoVRPtWjQZr4MZpc47OmrKGIMqW/eo7X2xYiQVPT1sYKtO8kd46z3VWju1Ib1
	y3NuMg4NLPBJwf17YCfsLCsVbI40XAAM1XoFhnPVADknn2aC+LbT6ONJbBCJ3zlJYdbCdH03V8U
	z9PlYnbaKBOBvdcjbUN6WzppKmLg6LgIkN/Tdko0nZ8yF+AZEaTj9pMIv91Vr++eJ6lMoAMjPFQ
	/PON
X-Received: by 2002:a05:6000:4301:b0:439:b886:20d3 with SMTP id ffacd0b85a97d-439c7f7e5b7mr2101563f8f.15.1772610748337;
        Tue, 03 Mar 2026 23:52:28 -0800 (PST)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60f764sm42229774f8f.3.2026.03.03.23.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 23:52:27 -0800 (PST)
Message-ID: <97a56169-b71c-4ad0-8992-c6e2d381ff02@suse.com>
Date: Wed, 4 Mar 2026 08:52:26 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] modules: Move 'struct module_signature' to UAPI
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: David Howells <dhowells@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
 keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260302-module-signature-uapi-v1-0-207d955e0d69@linutronix.de>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260302-module-signature-uapi-v1-0-207d955e0d69@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 720841FC055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,kernel.org,google.com,atomlin.com,linux.ibm.com,huawei.com,gmail.com,oracle.com,paul-moore.com,namei.org,hallyn.com,iogearbox.net,linux.dev,fomichev.me,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-11547-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Action: no action

On 3/2/26 1:42 PM, Thomas Weißschuh wrote:
> This structure definition is used outside the kernel proper.
> For example in kmod and the kernel build environment.
> 
> To allow reuse, move it to a new UAPI header.
> 
> While it is not a true UAPI, it is a common practice to have
> non-UAPI interface definitions in the kernel's UAPI headers.
> 
> This came up as part of my CONFIG_MODULE_HASHES series [0].
> But it is useful on its own and so we get it out of the way.
> 
> [0] https://lore.kernel.org/lkml/aZ3OfJJSJgfOb0rJ@levanger/
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

This looks reasonable from my side and reduces code duplication. With
the removal of MODULE_SIGNATURE_TYPE_MERKLE in patch 6, as reported by
the AI, the changes seem ok to me. Feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

