Return-Path: <linux-kbuild+bounces-12151-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD2WEpISwWk7QQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12151-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 11:14:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D691A2EFD0C
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 11:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48B63300383D
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 10:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22734388E52;
	Mon, 23 Mar 2026 10:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OS3M+qbu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0014B386436;
	Mon, 23 Mar 2026 10:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774260878; cv=none; b=synSBb5BETBSdthtJHbMSJlaqX2s3LcWgWuxt9XW/TA1B0HXmymfLj+70eUxOWt18vA9qsjuLECTo4/PHO4S5eAOMysrkdGSSvG881PQItqXG8nkGstoJLSN6Z9Ibiv7EwmIO6/95PyIAwIrmlDMIxd9T736gqASvM8VKV6OZzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774260878; c=relaxed/simple;
	bh=oerB1WWxL48/4S0FWQM8KbgtK24CS2HM+Renmll0YpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5CbPJVRZRgpnEKXZR4fdFQH1FvWy/kLEGFuN2sEQTBNtvTqe/v2DDe8vD6AJRkYv5iO33sp93lfdzqPRDiGgecPU6bLDd70GSjw359qIPycc1d4/kbBnw4m5tW5NuiwIxtc5shFQIpVODKwBx0H1050/kSQMQb52GV95yB2POo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OS3M+qbu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2243C4CEF7;
	Mon, 23 Mar 2026 10:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774260877;
	bh=oerB1WWxL48/4S0FWQM8KbgtK24CS2HM+Renmll0YpM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OS3M+qbuwk0+Km6yV4c+36VvjE2OK2eRv7NgCJAXK4W8vQq0yOBtXYGchfu7/WEfL
	 Zq7t5dic1U98tm3z4t0+c2ayBzYS5Jpc9kjttDS/9IEbYIzTPua/fz2xY7JY/VixPz
	 Z0S2cwUEDUpz2ZfGg3gBC+Wpb84GOBDcihUXtRrbllrj/h/Xg+VULFKvCbJc94xmeD
	 8srImhK1bsCRxfoJGcXF/advujhhMdrsBAsGRNbB/f5jlrS8GCExZlEWsuKqZcazQ7
	 WiOkTqOUjefMDP8Otku1Y6jN2EW7hKLSqI5ylFSJqSH+xJp7UnSbeXUyLTVr1barvT
	 0W8qRAM+p6i+g==
Message-ID: <e6db8617-6b12-4f90-967d-85c9f7805823@kernel.org>
Date: Mon, 23 Mar 2026 11:14:31 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] char: nvram: Remove unused nvram_mutex to fix
 -Wunused-variable warning
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nathan@kernel.org, nsc@kernel.org,
 ojeda@kernel.org, masahiroy@kernel.org, linux@weissschuh.net,
 tamird@kernel.org, rostedt@goodmis.org, ihor.solodrai@linux.dev,
 ritesh.list@gmail.com, maddy@linux.ibm.com, peterz@infradead.org
References: <20260323073220.25798-1-venkat88@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260323073220.25798-1-venkat88@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12151-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,kernel.org,weissschuh.net,goodmis.org,linux.dev,gmail.com,linux.ibm.com,infradead.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D691A2EFD0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



Le 23/03/2026 à 08:32, Venkat Rao Bagalkote a écrit :
> v2:
>    - Added missing Suggested-by tag from Ritesh Harjani (IBM)
> 

Patch history must go _after_ the --- below, otherwise it will appear in 
the commit message when applied, which is pointless.

> drivers/char/nvram.c defines a static mutex 'nvram_mutex' which is never
> used. This results in a compiler warning on linux-next builds:

It is probably not only linux-next builds, I think the problem exists 
since 20e07af71f34 ("powerpc: Adopt nvram module for PPC64")

> 
>    warning: 'nvram_mutex' defined but not used [-Wunused-variable]
> 
> Remove the unused definition to avoid the warning.

It is not what you are doing.

You are just hiding the probleme by saying 'maybe it is used, maybe it 
is not used, I don't know I don't care". Please properly fix the problem 
instead.

I think the fix is probably to remove the #ifdef CONFIG_PPC32 around 
IOC_NVRAM_SYNC.
If you think it is important to return -ENOTTY on CONFIG_PPC64, just add:

diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
index 9eff426a9286..2fd744bf9093 100644
--- a/drivers/char/nvram.c
+++ b/drivers/char/nvram.c
@@ -308,8 +308,10 @@ static long nvram_misc_ioctl(struct file *file, 
unsigned int cmd,
  		}
  #endif
  		break;
-#ifdef CONFIG_PPC32
  	case IOC_NVRAM_SYNC:
+		if (IS_ENABLED(CONFIG_PPC64))
+			break;
+
  		if (ppc_md.nvram_sync != NULL) {
  			mutex_lock(&nvram_mutex);
  			ppc_md.nvram_sync();
@@ -317,7 +319,6 @@ static long nvram_misc_ioctl(struct file *file, 
unsigned int cmd,
  		}
  		ret = 0;
  		break;
-#endif
  #elif defined(CONFIG_X86) || defined(CONFIG_M68K)
  	case NVRAM_INIT:
  		/* initialize NVRAM contents and checksum */

> 
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> ---
>   drivers/char/nvram.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
> index 9eff426a9286..2ce3307663ed 100644
> --- a/drivers/char/nvram.c
> +++ b/drivers/char/nvram.c
> @@ -53,7 +53,7 @@
>   #include <asm/nvram.h>
>   #endif
>   
> -static DEFINE_MUTEX(nvram_mutex);
> +static __maybe_unused DEFINE_MUTEX(nvram_mutex);
>   static DEFINE_SPINLOCK(nvram_state_lock);
>   static int nvram_open_cnt;	/* #times opened */
>   static int nvram_open_mode;	/* special open modes */


