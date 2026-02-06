Return-Path: <linux-kbuild+bounces-11056-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH0zKFfbhWn4HQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11056-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 13:15:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2AFD87F
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 13:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48230300D4D8
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 12:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DD63A900B;
	Fri,  6 Feb 2026 12:14:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BC23A785B;
	Fri,  6 Feb 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770380095; cv=none; b=ZoIfhToi2nJ42WKcfVJ4sCvYgQZKSC4o6OytxrxU0T2jtvMLiy/Du2OkYz8JihDPHKchdG+YxqU/8+HPHnLgc0LViRCFJgLU/M6xrig1MqTEAXzBSUB2O2ufI4rz8gG8UhyWOCmkidYyd0k4M7jEnaNNqOZCUTHansmdKTydFp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770380095; c=relaxed/simple;
	bh=+2Q8L9pTwOmyIEL5LTFG/7CvYQSVkgnYrizu6sFmqlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6N5LI0J4xe1Vldm8QgORGJOV9iV9lDbFgTkFbL6gRE2TQx8xRrduoV+J5BUKLQaJJHxI7KGSaE46XTRLPAGjJmd2+ThjIoZC0/nfSme+vqA/JDVuUoYQ1KcI6oF7ayqxx48zG3/WQOcD0EI4eAF+bz7pouITjNolCeptX6TfW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from [192.168.1.209] (unknown [27.19.236.155])
	by APP-05 (Coremail) with SMTP id zQCowABX7A8A24VpBSObBw--.44121S2;
	Fri, 06 Feb 2026 20:13:54 +0800 (CST)
Message-ID: <9323714a-b15f-4616-a525-780accf33b52@isrc.iscas.ac.cn>
Date: Fri, 6 Feb 2026 20:13:52 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] RISC-V: handle extension configs for bindgen,
 re-enable gcc + rust builds
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>,
 Mingcong Bai <jeffbai@aosc.io>, Han Gao <rabenda.cn@gmail.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Jason Montleon <jmontleo@redhat.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <20251230-gcc-rust-v5-v6-4-2ac86ba728c8@isrc.iscas.ac.cn>
 <87v7gk8r5x.fsf@posteo.net>
Content-Language: en-US
From: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
In-Reply-To: <87v7gk8r5x.fsf@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:zQCowABX7A8A24VpBSObBw--.44121S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gry5Kr18tr13Zw48Wr4xXrb_yoWfCwcEga
	sayr4qkw48Aa18A3WDJF4rCFZFgw4DCa45Xw4DGw4j9r9Iqrs8XF1q9Fyvv347KrW3Jasa
	grs3Ww4UX34SvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j6BT5UUUUU=
X-CM-SenderInfo: x0lq233loux21fy6x21ufox2xfdvhtffof0/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11056-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lwn.net,aosc.io,iscas.ac.cn,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xinrui.riscv@isrc.iscas.ac.cn,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.916];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,isrc.iscas.ac.cn:mid]
X-Rspamd-Queue-Id: C0C2AFD87F
X-Rspamd-Action: no action

On 1/29/26 21:49, Charalampos Mitrodimas wrote:

> I'm under the impression that the `!RUST ||` guard here doesn't
> actually prevent the `$(bindgen-backend-option,...)` call from being
> executed. `$(...)` shell expansions should happen during the textual
> substitution phase, before symbol dependency evaluation occurs, check
> documentation at kconfig-macro-language.rst lines 228-229.

I suppose this is unavoidable if we decide to probe options rather than 
rely on version numbers.

Similar issue also occurs in `cc-option`, for example:

	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imv)
	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)

For 64-bit builds, `-march=rv32imv` will still be probed; for 32-bit 
builds, `-march=rv64imv` will still be probed.

I agree with Nathan that this trivial waste is worth it for the sake of 
simplicity.

Best regards,
Asuna


