Return-Path: <linux-kbuild+bounces-11300-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHtsAikxj2mhLwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11300-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 15:11:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E034136F7D
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 15:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 078AE300C0E2
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 14:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64E135F8DD;
	Fri, 13 Feb 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XQ7qIbOH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="I8rC6LkC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D035D5FA
	for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991910; cv=none; b=ACnCbTeIm/1TRUnakUSuY+CcQ2Uemco/MerhGumfHloknGvmo8mqOtoMakA6CZPuYG+0Hs7qmbF71xc6WHoAihh8ljTTe7uoIjgnCvDB4sNZ11p9q6wpwWZVzem82/uE4sQS0rXRQowWouW5eXvbMYHL+9NthlugBBjrDPIYVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991910; c=relaxed/simple;
	bh=6cLnfUZAs+yk7KbeeS6F+Pq5kNHB19xTX2baVXfcN5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olZIE6Wb3ibxOK5Iw409mqnXpZg1DT/5HKi/inN9/WqDsf2OcVZGFRyRx7XXPhPcCtN6AJKbCiIuV1IwtQ4JH0gaHJah9vMkDoaiM0G2xKBYcxagrbpGxUuZy8iRFNcsz+PUzcO+f4s0gseQSbB+6R8vVeVNTCNNpTc6pcv5IyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XQ7qIbOH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=I8rC6LkC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770991908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ii0g1jv8fE87XK8ACC94JMMkpOuPMvHxDIekJymNWR4=;
	b=XQ7qIbOHGc94J7o5FmHuWloBlj6M/4cyo5LnePgwTpWtZ+3HBnDHrnW3ParLZ7Rf3Wqrbk
	0mjmPEmZE5cibe+zaRKm1yVxqn78x0SshCk5GGHnWX5F8fOjyF3BQONaAUfs1a2hXfNX4r
	MYcMBLP9oMPDanMg9zysb7LGMH2dX0M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-x3b3TzD5MmOWJh2kE-oANQ-1; Fri, 13 Feb 2026 09:11:47 -0500
X-MC-Unique: x3b3TzD5MmOWJh2kE-oANQ-1
X-Mimecast-MFC-AGG-ID: x3b3TzD5MmOWJh2kE-oANQ_1770991906
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4376e25bb4dso1209549f8f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Feb 2026 06:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770991906; x=1771596706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ii0g1jv8fE87XK8ACC94JMMkpOuPMvHxDIekJymNWR4=;
        b=I8rC6LkC2sPSgHkgqIFQhe+yBWyn37Nj3Hkgm4CqNIvsDOL9qgjFSlXmYBH2083YEw
         ZnWR15jrT5CDG34pfPZEvvw5xArWEtO3yjg01sBUP1tGeakO7OIjGRfXchyrSVu4kx+c
         ogwx/SIiv2Im1FDC4eRcfvcIf47Tg9GEI117saJAd5TX0ELXNFq1+qYkhgMwzUHPTh5P
         ulpysba4Vnbi6+VEH5wGIfo/axR64P0yld0lXoVniZVVCfxK1HjyDGfCpbru/wLTZCdx
         CNIeZND4yZtQgtVQj6JUQamrsm3leS34yqoTD5u8KgFUj9u72T3sTAwCCPHmP8vsmRSB
         KOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770991906; x=1771596706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ii0g1jv8fE87XK8ACC94JMMkpOuPMvHxDIekJymNWR4=;
        b=FlCbOnk6qevb/QRgnKVRkFHC7fxN4S4QsjN/mVjDzHAnjT8nvTN4csK/cd1J+Eh6ru
         y1KL7FmXIat/a0917Nbr7ORZ95osB3ocQBORBCh68W3DBhQHu9KInHdYXT0QnvZFsBSg
         EOoI9kWtjbxTBlfMkWg4hVnNRd+rELfYUbWbSG4G5x2FulX83RFIJ5XbDLjqxdQTHuQa
         MuwHFAsLPQnowC7fREXt8lQBt+bxmH+fUUzHH/MKzNXPh/HCXuMd8CwUL3dgqVF9Sy6X
         UlZMw58xmT/nT/T0S4489JcnnekjP7gqmObdZp4erMOP7OUhaUe8+/PPhKc/OaWUKiz5
         BPZA==
X-Forwarded-Encrypted: i=1; AJvYcCUYeB9MV90uCcft3y11tnR15xwOL0NuslcCClEmKmhpoufVK7tIuBUX2T3QUMDAbzdM8HSzmY2rkJ+FuFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC9LtyTEFEJ5uBWKiKSwp8HU9YJ+6C1c3Zo83sL/vnGKTzqbcc
	Az+Bv11PsSHUMHpryxUmoDYdAQISqmV0jOWTNxOZhso4EdIzPx30YF6RhsHeCkHpnGTR7AYO8Tk
	MNKapY4DuOTUdrN/qJZXACxEwt1WjfQhLWb3Qnv+hoE8Jv7w38eiF9RrQY4MZo83GFw==
X-Gm-Gg: AZuq6aIKoTz+pFJh+OGjwHZxd6ZVg7/etegzMiCiJ0PPY1EyYgmjnsCIRuT0I1DAdvH
	QpAZaGbRqqPLgKjRZod9Ju5NccmLDUq4gcm7CeFyv6VGVXp9qcU5jl66Im/VclsME/85mLTZx4j
	1nf7DsbJQUGkDoITqubHV9xRUtw8HOqwWXzOlMcJmFyZ9yoG8hRGPqqMHBk02q+7Qs8d+i2mXiM
	glurhtbyNN0WATpgsyR7qcTTZifjOJacE83+u/OJSpNan5LmcZ07/GU/SfRitpb25DFu9mDv7vk
	9QckcRybbWSXEGdPlpRR7BBIyrHSBoy6hXi9prGfrVgiuPMa0JtsBT49aSr1QlZiHV5uyACm5Tg
	KjDv95zn8XMwYbbA/gRIJCsbDbeH8VK9RwMH1zbtn2IBCWkHiW/QR5q7Dqsz7rUlkxBM2emo=
X-Received: by 2002:a05:6000:220d:b0:436:d824:620b with SMTP id ffacd0b85a97d-43796aefa84mr4107131f8f.39.1770991905741;
        Fri, 13 Feb 2026 06:11:45 -0800 (PST)
X-Received: by 2002:a05:6000:220d:b0:436:d824:620b with SMTP id ffacd0b85a97d-43796aefa84mr4107073f8f.39.1770991905184;
        Fri, 13 Feb 2026 06:11:45 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6ba57sm4915369f8f.15.2026.02.13.06.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:11:42 -0800 (PST)
Date: Fri, 13 Feb 2026 15:11:38 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Steve French <smfrench@gmail.com>
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: Address -debuginfo build regression
 with RPM < 4.20.0
Message-ID: <aY8wyR572eZYWVJY@sgarzare-redhat>
References: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260210-kbuild-fix-debuginfo-rpm-v1-0-0730b92b14bc@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11300-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sgarzare@redhat.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[find-debuginfo.sh:url]
X-Rspamd-Queue-Id: 9E034136F7D
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 12:04:47AM -0700, Nathan Chancellor wrote:
>Steve reported a build issue with commit 62089b804895 ("kbuild: rpm-pkg:
>Generate debuginfo package manually") on RHEL9, which has an older
>version of RPM than what I tested. Turns out that RPM 4.20.0 fixed an
>issue with specifying %files for a -debuginfo subpackage.
>
>The first patch restricts the new -debuginfo package generation process
>to CONFIG_MODULE_SIG=y and RPM >= 4.20.0 to ensure it is actually
>necessary and working. The second patch restores the original -debuginfo
>package generation process from commit a7c699d090a1 ("kbuild: rpm-pkg:
>build a debuginfo RPM") when CONFIG_MODULE_SIG is disabled to keep the
>-debuginfo package around for older versions of RPM.

Yeah, I had similar issue on Fedora 42 (RPM version 4.20.1) and this 
series fixed my issue.

>
>---
>Nathan Chancellor (2):
>      kbuild: rpm-pkg: Restrict manual debug package creation
>      kernel: rpm-pkg: Restore find-debuginfo.sh approach to -debuginfo package
>
> scripts/package/kernel.spec | 57 +++++++++++++++++++++++++++++++++++++++------
> scripts/package/mkspec      | 38 +++++++++++++++++++++++++++---
> 2 files changed, 85 insertions(+), 10 deletions(-)
>---
>base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
>change-id: 20260209-kbuild-fix-debuginfo-rpm-718f81dbcaa6

Tested-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano


