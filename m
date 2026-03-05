Return-Path: <linux-kbuild+bounces-11579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Nt4CyxiqWli6gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11579-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 11:59:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEABE21035E
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 11:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FD34305BBAF
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 10:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4A7382F12;
	Thu,  5 Mar 2026 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FPSKs0lr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155B37F8A3
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 10:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707995; cv=none; b=M7yQseRFfRlseocHeByJl98aQrKtckN8yDNqgO7KS7hNzHeYV6B9X80yh1xddJS1xX3nH/quzzjrEaalD5+/+icyQEiPJvN1ZjI7BJte8tMA51ZPanD9PyfWr/aoRqA6Z3UjLqlhFUS11NBvcaef6p8YgTjlQkvBUXfaLCXInS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707995; c=relaxed/simple;
	bh=rs3bg1xVBMOIHl8pwvkjraFExtOanyyrx+EFz99dEDs=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=g5GK7ySEEvwPkB1M1gEdHFdJXEPqQy1AxVMzQ+4i6RT7eSQg8CYERuQbGNSZqepTgbfTepkZ/myJ0olhuaZSD4oxKF/XXgQSBTrL7cAyCdEai3yP9eTxoeC6d2xW3Ceqog9kng5sAQ/aD0kF2fXZsicC1xYuG7zz9/t/6WuVuwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FPSKs0lr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772707993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNU5NICRfpcxZgiMM9TUX/QSXZor0ct6JOqY4Ec4h94=;
	b=FPSKs0lrLIxbruLsfWqr+VRPiCOcJhzMhcgp1jdkQkTbYpzFInstadXQxP5qa1cmBQsa/0
	c3ITJR3o32bI0VwBCbCw6d8mTZ/MWgzCIzvSovR8iyyeRdF6MHhpXHWRy4/EtTO03A9yQO
	6mXmKRIREAbH0aMbZXNovhkYhE7uP9c=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-391-G2eoyCM-MW29ZhCAlPKaPA-1; Thu,
 05 Mar 2026 05:53:08 -0500
X-MC-Unique: G2eoyCM-MW29ZhCAlPKaPA-1
X-Mimecast-MFC-AGG-ID: G2eoyCM-MW29ZhCAlPKaPA_1772707983
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6C35A1956089;
	Thu,  5 Mar 2026 10:53:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.32.194])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 63BBD1800671;
	Thu,  5 Mar 2026 10:52:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20260305-module-signature-uapi-v3-3-92f45ea6028c@linutronix.de>
References: <20260305-module-signature-uapi-v3-3-92f45ea6028c@linutronix.de> <20260305-module-signature-uapi-v3-0-92f45ea6028c@linutronix.de>
To: =?us-ascii?Q?=3D=3Futf-8=3Fq=3FThomas=5FWei=3DC3=3D9Fschuh=3F=3D?= <thomas.weissschuh@linutronix.de>
Cc: David Howells <dhowells@redhat.com>,
    David Woodhouse <dwmw2@infradead.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Aaron Tomlin <atomlin@atomlin.com>,
    Heiko Carstens <hca@linux.ibm.com>,
    Vasily Gorbik <gor@linux.ibm.com>,
    Alexander Gordeev <agordeev@linux.ibm.com>,
    Christian Borntraeger <borntraeger@linux.ibm.com>,
    Sven Schnelle <svens@linux.ibm.com>,
    Mimi Zohar <zohar@linux.ibm.com>,
    Roberto Sassu <roberto.sassu@huawei.com>,
    Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
    Eric Snowberg <eric.snowberg@oracle.com>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E.
 Hallyn" <serge@hallyn.com>,
    Nathan Chancellor <nathan@kernel.org>,
    Nicolas Schier <nsc@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
    Daniel Borkmann <daniel@iogearbox.net>,
    Andrii Nakryiko <andrii@kernel.org>,
    Martin KaFai Lau <martin.lau@linux.dev>,
    Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
    Yonghong Song <yonghong.song@linux.dev>,
    John Fastabend <john.fastabend@gmail.com>,
    KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
    Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
    Shuah Khan <shuah@kernel.org>, keyrings@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-s390@vger.kernel.org, linux-integrity@vger.kernel.org,
    linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org,
    bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 3/8] module: Give 'enum pkey_id_type' a more specific name
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Mar 2026 10:52:47 +0000
Message-ID: <287135.1772707967@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Queue-Id: DEABE21035E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	TO_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11579-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[44];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,kernel.org,suse.com,google.com,atomlin.com,linux.ibm.com,huawei.com,gmail.com,oracle.com,paul-moore.com,namei.org,hallyn.com,iogearbox.net,linux.dev,fomichev.me,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,warthog.procyon.org.uk:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action


Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> wrote:

> -enum pkey_id_type {
> -	PKEY_ID_PKCS7 =3D 2,	/* Signature in PKCS#7 message */
> +enum module_signature_type {
> +	MODULE_SIGNATURE_TYPE_PKCS7 =3D 2,	/* Signature in PKCS#7 message */
>  };

It might be best to just kill the enum and replace it with a single #define.

David


