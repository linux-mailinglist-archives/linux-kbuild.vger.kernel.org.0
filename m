Return-Path: <linux-kbuild+bounces-13825-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wS5dOQmONGrNbAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13825-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2026 02:32:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDEB6A33B4
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2026 02:32:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PTiWl3pE;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13825-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13825-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD2D33037495
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2026 00:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1A619AD90;
	Fri, 19 Jun 2026 00:30:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B541946BC
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Jun 2026 00:30:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781829014; cv=none; b=P5dKOkZJY1I8CmdIM978CdbhfjubYGgBq1/viMZLrkk3R5MIZi8W7S9TE1oAoE+BS6RLTyOcqv9PV9BJthwB2UsoDgGrbwXKGIUrbvsxq4xcjvm31rqlqk4wTSkFJ2+YFgaEAMu3ILG3WPPhqLVR2UYRrm7WHT2YwnspVBgDxcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781829014; c=relaxed/simple;
	bh=FkT+PzJWxq7ZJBIwx9CFmzA6UcqEyKPiDAgAVJt99Go=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kzYf8px91cT2PJbnQc798Nq0TuevC7XSBiuC4th/pFVAcevEF0rM2Ky3LIszvqlCybLQ1mhkzN53IUos+lKiA0zbcwueQQ2cNGWyy9Y6Mi/Ug4oT38jznbpb2FXQqOZWC51k/XnIoooLk76ya4T6tjyi13KH4tYkomNtjn543eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTiWl3pE; arc=none smtp.client-ip=74.125.82.182
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so2214687eec.0
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jun 2026 17:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781829012; x=1782433812; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rl8vxzNGQQkAE3mqEDnLG1B9cWbhQEBcyRa/1yDKl7A=;
        b=PTiWl3pEjEW5lKf3T44s3MTl6PzyjsvS7cJept8leyHNbHRYNdc4hYaCWcsb/ritqX
         SNpE2RRKjqQa/zAS733sAEgJK2F2mJu8k2yjaL4fTKUlGebefLtvdb1XEdk7FHmjILrC
         jZsLOH33TaAZA58dIqqSEtZvxiz4qUNc/DAnj5y/VQxTDiA9445xsPqpa2kywI4ghHOb
         TNfi1/UaPUZZtJhvUvYAMi4Sg4DkVrsePVs6jEZCwi0Zp1u6Mnjq/zlyk/HfSJpD52jE
         tK0+80gZ8pyYYyBzihSlXAppLtzxMVHQlSDSiszMjr6rNfAp01O8geTwGNioeD6gSpP6
         jywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781829012; x=1782433812;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rl8vxzNGQQkAE3mqEDnLG1B9cWbhQEBcyRa/1yDKl7A=;
        b=nG+Y2VV3/5v/6EQ2CN8LO34KVTrFdrAtDo+i1J9llFy/DUR7P3UVVXuNVBrh0VjKts
         Nqs16E3Xiv7TwtN+15C7j0DYuoKLT1x9KgZs8uCOWRKMynWx8uG6BAUX2HHxREYyN+CJ
         Gp5rqLV4ub1a/TEMtLz3E/VM/x5m2MM40OfZtXf4OJy+IareBMQwvTMbqgcKOi5IEd40
         xpvWAVJnubLmSOQIfYEBXVFDLI0drgfI2QoFrB0DpJZ0A5GStvWBdmyacWFArJP1SEKu
         WbAQ530hNy3/34o80nzJgwRdAieM5O7xVjGu0xHlb3vAFFiWLi6MiVIi56KUEhWb31Od
         ZPiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qVl7W/DaNdyR231wMIzk/ekZvoR7lETY5d56xbdgzEto9ffrs0OjJMfzhdaeBk7/pxdlyzRUabTN6mCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwucO1zwIcT6/C6Fw9rX5GfaiAbri+TZ7hW7VnfWGkkMzG/wruf
	ROsqzOcWvirEhCDu8IKKo9FVFgLWJYlEDt/ptbXPqh1Q0PBkl6OcG9cK
X-Gm-Gg: AfdE7cmqt2wS5AQEIGodaWRepnJ6sYt4Ys+drHqVSR2nI4Ee15UOKVOMZ+ZTBdXCEgO
	Od6YEO8kaxIWF1TVeo7pTzC88MUJ9Z3eG3uiWDy6u5HEAFVI9goyhpHL2cjdqG9v5efK1Vu9NDg
	pvBQrmqUrLRy2Bu/bXKChxSNJf6mAJtaxP0iMjNQ+dCkuvKUxMNIHWWDOytVErTC4dcwh7+x2RH
	D2dqSklKTxnp/fXANqndhgGVpqQ/7HmTa+BZwmdvCbr4a0YHyNUZ9KGIvE1pjW1S1h8nRNY/sSp
	k0Qhx5f1CUjQGJ8cfUF7yDg4zkFsLb+qUbsqQk8vvhL/DQ0xCa2iJC+JwazL9XwSNbgZPgyTYnK
	CkK5ONVBYr3MKaps7NMD+ExouOqAkOFyfFZh+Y+8KSFEElr/0RCjuiLQ5xCQjqJS3nbfpFNgAnG
	WcRn30G8LWkNDdqwZ5ebjUiD4DFnfUD6rgDAaW0inrj5NOi9GtetrPguV5BNGRRNo3+SyL
X-Received: by 2002:a05:7300:220d:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-30c071dfe31mr1156393eec.17.1781829012067;
        Thu, 18 Jun 2026 17:30:12 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:ae6d:cb3e:a1c:6cba? ([2620:10d:c090:500::3:8ac8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c0682b382sm918298eec.11.2026.06.18.17.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 17:30:11 -0700 (PDT)
Message-ID: <de31cfde013f502e05d6c01a69a49a758a0af51e.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 2/4] selftests/bpf: Modernize resolve_btfids
 test scaffolding
From: Eduard Zingerman <eddyz87@gmail.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov
 <ast@kernel.org>,  Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi	 <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Date: Thu, 18 Jun 2026 17:30:09 -0700
In-Reply-To: <20260617210619.1562858-3-ihor.solodrai@linux.dev>
References: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
	 <20260617210619.1562858-3-ihor.solodrai@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13825-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:emil@etsalapatis.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[eddyz87@gmail.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,iogearbox.net,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,etsalapatis.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CDEB6A33B4

On Wed, 2026-06-17 at 14:06 -0700, Ihor Solodrai wrote:
> Refactor resolve_btfids test in order to:
>   * use newer ASSERT_* macros instead of CHECK
>   * extend the lifetime of loaded BTF to enable additional checks
>   * cleanup unused/unnecessary code
>=20
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---

Acked-by: Eduard Zingerman <eddyz87@gmail.com>

> @@ -153,15 +136,12 @@ void test_resolve_btfids(void)
>  			break;
>  		}
> =20
> -		ret =3D CHECK(!found, "id_check",
> -			    "ID %d not found in test_symbols\n",
> -			    test_set.ids[i]);
> -		if (ret)
> -			break;
> +		ASSERT_TRUE(found, "id_in_test_symbols");

Nit: 'break' is missing.

> =20
> -		if (i > 0) {
> -			if (!ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check"))
> -				return;
> -		}
> +		if (i > 0)
> +			ASSERT_LE(test_set.ids[i - 1], test_set.ids[i], "sort_check");
>  	}
> +
> +out:
> +	btf__free(btf);
>  }

