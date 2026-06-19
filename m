Return-Path: <linux-kbuild+bounces-13826-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ZjfNbCNNGqbbAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13826-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2026 02:30:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 751366A3383
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2026 02:30:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kEleJeHi;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13826-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13826-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF0B3301601C
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2026 00:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E6119CC0C;
	Fri, 19 Jun 2026 00:30:38 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F03D4AEEF
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Jun 2026 00:30:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781829038; cv=none; b=ROMffvyykuj5J5dfvyHz30OiOkrGDlekeU9ZVqOwAdl6vLHY1bZVbEjXWA8r4w03xDLQ+7poK+FMhPXdzVwDMUObIIiqZi2XsnJ/yHe+oyu/LcoRvnNY1PQtvBwKFVXVzi/6bavVVQ/+rEQ6RJJxj2HrgyFApdlRVnEYcDQkIk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781829038; c=relaxed/simple;
	bh=hvbIk5SojXr+ZJBfDkpyXUPKEQomDt0eXG4CXMpDO+c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=We87HRSiM3Dhx/pYckgHGc05UENeZq6dJKgXJhtj8jwPV8GZ9iP1/IRpk0i5XRbq4EJxs2QmRWNav4O//WJ0SQAT8uxiMXgD0rvWpnvOcTfOHmjYRkpFnpQPSscNd/y3GEEU0wfAAGOGp+o4FTn44kwY5KFXvBPEc3w40BZcGwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEleJeHi; arc=none smtp.client-ip=74.125.82.171
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30b6dad2382so2992699eec.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 17:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781829037; x=1782433837; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hvbIk5SojXr+ZJBfDkpyXUPKEQomDt0eXG4CXMpDO+c=;
        b=kEleJeHiSnXW3n/o7zycSzSEPxLNn2fRmCv1YVtepm4hVc/nFeocFbfspgZPpGThNd
         09JwIZeVP5uVSUY0aIK2wqbu2KZvrKY2VwTTKZ3YdSYTnV4gh7ionamGHQfQmZ+twk1v
         TzmAXv7SYWzeOBl6dX8MEjScv3Eucq27SRrdY6izo9dnWjwkY3O5acDyOv2c0Pa+Ud62
         v82qPfWgDcLDfLnunkBJEFvbGqWrarBQ3ycelXBRBEyiu/b01Ussf095zlHP04ddfsea
         nsw255NTTT22V6YyKcFySSAEuL/uw35Ekecv6wSilVmsVgT8TgkW4a0jsXUcy1CFz1Lg
         3XHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781829037; x=1782433837;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvbIk5SojXr+ZJBfDkpyXUPKEQomDt0eXG4CXMpDO+c=;
        b=j6nGzeLt1CS83MyX6Dh78ylYkC7x6MbImnDqCsz6u+MMJu7zF75sfN4vw2mOhlVaY1
         jBWphLYQhEtQcHg4KTu19+vLzLvuK+R83iKiHuLyLFxLA4N6DtbXXtPn3p4DwBT41/fH
         d2G8PojqY37dFFYo9AOlG5B47/R6Q9IhB5nnxew8pS+8Su7qwNBPDWPBsn9mV22sKjSl
         7nJ+IgNmLsEEDUc0CC1h13NBwx4qG/0DWYz0J1NWsY/9M1gcZn5fGoH3emIXO7X/x+jO
         2tsKWGDoaGZAwBWZ9r6THwIKdpc968EPF5eZn/VTs43WehYEYmqoXSEako637W0albqn
         dgaw==
X-Forwarded-Encrypted: i=1; AFNElJ/s7pf4eeo6LEkjjj+VZQLE07TsdpsxeOcx/qsb8WPTDKApREpxqUjJe/FDohFXra0IEtNrHZXfoXTy9XQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFuDPQF1gYQ8oI9DxiBGZp1eiXkBuUlgaUOPffbysB8erhz8N7
	qRfYtduHkOqE/V13YGnv4z7yEIda8HfXM9xfhPb8FoPdZ8mep3SrIFRQ
X-Gm-Gg: AfdE7ckJFVNYHGNSq6h3P98+2UYHNWL3FVIKOpDVh1WPuYP5vbIDlt2tbUH5h9S4Dvj
	U+56uYv0c5eLAvQrWBq7XkYYazjIZWeMB9PcNv8elFquvAMBPEqVFTcDUcI2wQVtiTjft1ebNoT
	tIE0gmINtC8M9ETmXD5di5nZsb0etLBEzdBEdNL9Cpa71zv/UqbsTs31WvZwKc4K5J/Y9x0wnG4
	bqBE2yyQSq7B7M88bsOrTIQGnLznmBuwpWWhNl3/PtDjHgqdtbdYpYao/+dBckQIWDjepD/iISR
	l1ugMeC3/I4bQwtWDHdBbnNny9qOxdKIRPl/IQ/T+Mvuh+pQHBjDmXXe0ThBfUcXGo1m14+1RjU
	2oEfyPJECfAJEDBZCYnpFE0bjnmoX4Sv3Ym3LxOnAL/44pZNAwzRCYZ0WB8lML0NMlJ+BWHSm9w
	M3ekMiNWYjQcDSUCRapgZz/36l/FmDm65woXEgH5YWFSx5X2xTtq/s6jx2jSFSLx2TyezT
X-Received: by 2002:a05:693c:20d2:10b0:30c:2d7:cabd with SMTP id 5a478bee46e88-30c0cff3b63mr84557eec.9.1781829036416;
        Thu, 18 Jun 2026 17:30:36 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:ae6d:cb3e:a1c:6cba? ([2620:10d:c090:500::3:8ac8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c066cc0bdsm1022817eec.5.2026.06.18.17.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 17:30:36 -0700 (PDT)
Message-ID: <ec06d9d008496090a3b67cea357bafb3b516fb77.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 1/4] tools/bpf: Sync btf_ids.h to tools
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Date: Thu, 18 Jun 2026 17:30:34 -0700
In-Reply-To: <20260617210619.1562858-2-ihor.solodrai@linux.dev>
References: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
	 <20260617210619.1562858-2-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13826-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:emil@etsalapatis.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[eddyz87@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eddyz87@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,etsalapatis.com:email,vger.kernel.org:from_smtp,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 751366A3383

On Wed, 2026-06-17 at 14:06 -0700, Ihor Solodrai wrote:
> Sync tools/include/linux/btf_ids.h with include/linux/btf_ids.h so
> tools-side code can use BTF_ID_FLAGS(), BTF_SET8_START(), and
> BTF_KFUNCS_START().
>=20
> Keep the tools copy's existing compiler header dependency:
> tools/include/linux/compiler.h already provides __maybe_unused and
> tools/include/linux/compiler_attributes.h does not exist.
>=20
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

