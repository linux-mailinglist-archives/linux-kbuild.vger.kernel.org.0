Return-Path: <linux-kbuild+bounces-10482-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D58D0E92F
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Jan 2026 11:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC0CD30049F0
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Jan 2026 10:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0466623ABBE;
	Sun, 11 Jan 2026 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kkXfLBeF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VYN5UIgZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAEB23AB88
	for <linux-kbuild@vger.kernel.org>; Sun, 11 Jan 2026 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768127395; cv=none; b=hn8AuPkCyzsnaP58LwemNAUwaVSYZzor3eL+eoY/Q+PPFiZz8g99gst3wCr/LpeutZt3hMIVu1neEaWuoE64pXpASmdiyvdOfNH59h1gjpqkjtBf8sRsEVopDEdaxdbB7U5uxRO0AbMz6g6U/WOXoZV+0o1h7YQwJsuM7sNunKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768127395; c=relaxed/simple;
	bh=yheON5ZUbnn6ELwpk8zzv7Qh1BwJ8OdwbLEvQcYMY3w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=J853Zd1iRV8ICtgfbA0br2QKPlHC8F5cQvmQ+oS35fba7D91sul5oE47MUmaIERrPmJEOz9mubi4seoFmx9/AvXwDx1u7LzIA8ySAXCesXHsbsCQWNw0c4mEVOXSYFbDY9WqZTRNyUgWIHNgiBwQT4gpwYKOpZBtrwKCIAuAvGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kkXfLBeF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VYN5UIgZ; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id C40801D00129;
	Sun, 11 Jan 2026 05:29:51 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Sun, 11 Jan 2026 05:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1768127391;
	 x=1768213791; bh=6RMOPJc8MLLse1vRCBHrkSArguVZcEAgOQpWKXH1ESo=; b=
	kkXfLBeFbkVM+I3MkHzUbbdvNGJgv20iNAhceDK8f4zs35W4B/gedY/U5eKLR3tM
	rOWhaXDaMRyprCicbDlzTjlMgpqK+B3sNLgKnJGgRB7Uay2j39KvZZlMiL+M6xbM
	TVaArQiYNl9cZlfmyssXPJzDlk8KLYI0mdGmJOG/tTxIrjDqx6NUAqDCRIxNArC+
	vP3hsdtynuSX42ySf0GuHVr+qpBppnRtxjXEGt9dY25ahYEmjPsxD7Wk09IRUIMt
	am7hvBroOb5NLrGQRyNSPoIPkavB9HEmuPtYLYGCGeUo2HchNPg4C2OfIcryzgs6
	gGnvjVGlmg1UJMjf3F0dwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768127391; x=
	1768213791; bh=6RMOPJc8MLLse1vRCBHrkSArguVZcEAgOQpWKXH1ESo=; b=V
	YN5UIgZaHE6AJtSYxTU01H/IM4E5lFq4jHHhM+HWGLpR5IQ7mdt7MWfUzph04gTr
	vggEXRlhtK04iGSLvmsjMAoV9kgsoJklrgdx4ynmYlBVT1zxtJpL3ZUgz/8FmLHT
	QjFTOfjk+Ys2DcAkS6bwASfncg3jdsfHWu/xWkDR92MfsgF27KAe5FzdHkYdxVrb
	lEVmrhYMFmJJ/i1inNe3XwMrJXqXbhGPCvpMtmoUaMyuGYoVIdxa+kHmKstRmqug
	zSYMBl5QF/jWsGvICKsHQm3g8/PXpC79S6wyFG8/2sPly4DdkY4uWmBB/bXokptU
	yoTqQWBZn6t2P1AickaGQ==
X-ME-Sender: <xms:n3tjaezYK69uHA84vOPNy8rgTNc7YT0S_4RsXFgnQNLa6SG80ugUAQ>
    <xme:n3tjaVE4rnfr9xRWjm4KiAPe31ZA9q0zaIuDSqRmTBjG49HIBWYYx8M0QBT2UsuBB
    8qWDMVYaAON2VXDkRTE_7QmQdUM1yanWWopZsdHZCO38tLU-MQQpLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudegfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilh
    drtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehnrghthh
    grnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhuhheslhhinhhuthhrohhnih
    igrdguvgdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgt
    phhtthhopehprghttghhvghssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    eplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:n3tjaYS_4bq4i5yGW7ZA4Nm2JrENN94fubBJZWkGKtI7qP9s0R3Q2Q>
    <xmx:n3tjaSUKq-Hxy-dhB8lfvP4rCt0y9WXU8OokmtIIiGNY0lFHaQchdA>
    <xmx:n3tjaaTIsqSM5u4662PZD_k7ylPdd0QAm58S_v7oh5g_NDwfYF0rTA>
    <xmx:n3tjaS3HByArCczJwL9kady1Yx58CtdcH_qj6gK_FK0Y5fW_w8XDHg>
    <xmx:n3tjaVLTpELHxq_iTPLjVETCqjtofDWgm950wrawCgc5RpWY3uJ2evEW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 59B19700065; Sun, 11 Jan 2026 05:29:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Al1egLVrYt0c
Date: Sun, 11 Jan 2026 11:29:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev
Message-Id: <29b2e736-d462-45b7-a0a9-85f8d8a3de56@app.fastmail.com>
In-Reply-To: 
 <20260110-uapi-test-disable-headers-arm-clang-unaligned-access-v1-1-b7b0fa541daa@kernel.org>
References: 
 <20260110-uapi-test-disable-headers-arm-clang-unaligned-access-v1-1-b7b0fa541daa@kernel.org>
Subject: Re: [PATCH] kbuild: uapi: Avoid testing certain headers on ARCH=arm with
 CC=clang
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Jan 11, 2026, at 01:52, Nathan Chancellor wrote:
>
> To keep the build working while the root cause of the warnings is
> investigated and resolved, disable testing these header files for
> ARCH=arm when building with clang. 

I think we can just safely mark the internal unions as __packed as
well. The (untested) change below would annotate all of them
as being potentially misaligned so they can be stored at an
odd start offset, and correctly produce warnings when someone
takes the address of a member.

     Arnd

diff --git a/include/uapi/linux/hyperv.h b/include/uapi/linux/hyperv.h
index aaa502a7bff4..02ea5f2e43d4 100644
--- a/include/uapi/linux/hyperv.h
+++ b/include/uapi/linux/hyperv.h
@@ -362,7 +362,7 @@ struct hv_kvp_exchg_msg_value {
                __u8 value[HV_KVP_EXCHANGE_MAX_VALUE_SIZE];
                __u32 value_u32;
                __u64 value_u64;
-       };
+       } __packed;
 } __attribute__((packed));
 
 struct hv_kvp_msg_enumerate {
diff --git a/include/uapi/linux/vbox_vmmdev_types.h b/include/uapi/linux/vbox_vmmdev_types.h
index 6073858d52a2..15ccfb5d624c 100644
--- a/include/uapi/linux/vbox_vmmdev_types.h
+++ b/include/uapi/linux/vbox_vmmdev_types.h
@@ -229,14 +229,14 @@ struct vmmdev_hgcm_function_parameter32 {
                                __u32 phys_addr;
                                __u32 linear_addr;
                        } u;
-               } pointer;
+               } __packed pointer;
                struct {
                        /** Size of the buffer described by the page list. */
                        __u32 size;
                        /** Relative to the request header. */
                        __u32 offset;
-               } page_list;
-       } u;
+               } __packed page_list;
+       } __packed u;
 } __packed;
 VMMDEV_ASSERT_SIZE(vmmdev_hgcm_function_parameter32, 4 + 8);
 
@@ -251,14 +251,14 @@ struct vmmdev_hgcm_function_parameter64 {
                        union {
                                __u64 phys_addr;
                                __u64 linear_addr;
-                       } u;
+                       } __packed u;
                } __packed pointer;
                struct {
                        /** Size of the buffer described by the page list. */
                        __u32 size;
                        /** Relative to the request header. */
                        __u32 offset;
-               } page_list;
+               } __packed page_list;
        } __packed u;
 } __packed;
 VMMDEV_ASSERT_SIZE(vmmdev_hgcm_function_parameter64, 4 + 12);

