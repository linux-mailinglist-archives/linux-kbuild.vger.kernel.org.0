Return-Path: <linux-kbuild+bounces-12390-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PQRJtfgy2n0MAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12390-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:57:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A31DA36B421
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 364C63021C20
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 14:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32F43FEB3F;
	Tue, 31 Mar 2026 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ja6qDZVD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA2A36A013
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968972; cv=none; b=jxwDjq1OY7YuiklRBwsGgVo0V1oxY9WXaEi47HU1esK8ueJJ5fMYj9VdOcLgYlrsy9PkwzIoZEtcqGIzFAU1NUEMoKrP3KJuJzks3DNZBHU/B2j++X058QruunMFr7CzavotItnaIK7nZDL5RA8ZuUfj5UZAOQqB5QGudEojtps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968972; c=relaxed/simple;
	bh=jKxaM8XS+QGoasE5LVre1ULC0QIBA1mU1HIQ8CMnbPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDTAf6uG4Lv99PH0hJw9NJI3usr2QHOFVKqR2Y//GFtm6yq/S7CH4KSg48o2qVKPlNyeLhu0BZENX5DLgWMjOD5UlkBofMw7rD/eP3J/px4VDtX7LXriEcBiBra5dqM7h+axwa9Ez/epsNh4tWKSqTBvJji70IKRKWer5hPOFOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ja6qDZVD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso3641071f8f.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 07:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774968970; x=1775573770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOWUdy++pUefUEURVk9zZcOvlfK+YwiTNt/ou4gudNE=;
        b=Ja6qDZVDy0h/sUo6hcIdYSLoQmmKtNcVxEGyPGUA6v8KdsyMaTbRvRGvNceBj+Y8gd
         IDZ0LrrZpzJd0aN/rtuU6YcdKfRzjxAufGPR/Y+FfInty758n3UvwMNwV+UTisn1OgVw
         6VgagNOntG+VlIHBKByO+p7axUoImoEEHqfFPzGxNQ1AJLi7Z8gXzfNbwYjMP14RNAsW
         wcwqJPp+kNK3CELbzKKxjA0UyW7IP2O8ohkUsyLmQzUOjOl4UKU2VW8QWjlRp6qQIrUT
         nZ89/xuIQ/WfFRR168GH7MXgIb3KiEo7N1q6HUIIZD1+91za91We4vnWFx8PFRYGR30R
         oQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774968970; x=1775573770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOWUdy++pUefUEURVk9zZcOvlfK+YwiTNt/ou4gudNE=;
        b=l7SRAalnSvnP6DXi/rKQ2nqN2rnYDqYlpjUtIGlDethBHY9ZNlMmyLMGt7RPg2KS16
         qAXPqR12V5wZfPlBlc2YOmoNzVVxHyTKa9RBrDUYrNVc7aZjM/HRZekZI+uXJ+YpWOHv
         3cXaeDddrc5dztWyySdsRtXmh2yFe01v3G5Qz2bTMDuk+ylp70T6fByg0Ztr7e5vEbh0
         1hW38F3hOa9M8/WvZ6pw9/7GqfJZ9Wds3urxUCI8OtYCiRKjL7HyBwR60TUggc9CmDR4
         XDRxxX5KM2tOO/h9gxy7BxH//irT8jS1ON0RXU531orDfaXwA3I3wo/9TKphKPFBRZ2x
         FoJg==
X-Forwarded-Encrypted: i=1; AJvYcCVnFEsTw9Bv82FDZXGz0BQNnqH2nZMCRoPHAi+yaBpeaQHmy6e1Cg4wX+0uSnS6SZRAiqsjz6VKOlzRbG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8BB0h3K34cpXUT1wGXEpTGU6DMreOY+UNE+W4OgsdMxG3sk03
	NyeFKw62a0I/mF8NARgLagbFaWEsC3RbJ/bX0V4KpgIymJohSWchrLBLLVQZ3dstxvY=
X-Gm-Gg: ATEYQzyCf6k8L1+NUJ2WZb0rGEEuWghrWuomFWgtEfZXX566gsIxAnzFRUKzi/4GiWf
	EaKlmM/lQ7kRvrLM1N1uy+eOewDmJdcHo8WaJNJt/pkOIpe3gzfjR3RS2lHO6WUrHdvCAdSUpny
	/0PsYCPV+h5o1ltb5b9sL3IsLWo9Pffs/4Qgj/Ajf2pFITwJTmpwVoE/qn9lyas6z6CLRLIPXeC
	pJfrZgIv/opouzYnzVGzd0D6TjhYeorGmcnxjWjNbWfYnU3S9iWUunZqmFsW70WkfQVjU9jWOLF
	8G2yx4+mjxwbuonk8WFKxY4LIiuBtEMHGzQl/p0WOQeu8urMwunoWTrA33HZhDyYpe3CYm5h26r
	d/mgC5K4mP8FRZpcWd9fKMrohYHLIhpYZn9QdtjZCraOu2G1D0L9cugVXx8kaUEq9NzhMboEvVi
	s3+rI/SXH72OLxEq5PuWYNCZWtFw==
X-Received: by 2002:a05:6000:2dc9:b0:43b:490a:db51 with SMTP id ffacd0b85a97d-43b9e9fb32cmr29895659f8f.24.1774968966934;
        Tue, 31 Mar 2026 07:56:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d14c53928sm336419f8f.5.2026.03.31.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:56:06 -0700 (PDT)
Date: Tue, 31 Mar 2026 16:56:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init.h: discard exitcall symbols early
Message-ID: <acvghO4glmZamFSZ@pathway.suse.cz>
References: <20260331142846.3187706-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331142846.3187706-1-arnd@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12390-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,vger.kernel.org,linux.intel.com,gmail.com,arndb.de,google.com,infradead.org,suse.com,atomlin.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmladek@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,arndb.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pathway.suse.cz:mid]
X-Rspamd-Queue-Id: A31DA36B421
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adding module loader maintainers into Cc to make them aware of this
change.

On Tue 2026-03-31 16:28:38, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Any __exitcall() and built-in module_exit() handler is marked as __used,
> which leads to the code being included in the object file and later
> discarded at link time.

Is this safe for dynamically loaded modules?

Honestly, I am not sure what is the exact efect of this change.
The dynamically loadded modules just came to my mind...

Best Regards,
Petr

> As far as I can tell, this was originally added at the same time
> as initcalls were marked the same way, to prevent them from getting
> dropped with gcc-3.4, but it was never actaully necessary to keep exit
> functions around.
> 
> Mark them as __maybe_unused instead, which lets the compiler treat
> the exitcalls as entirely unused, and make better decisions about
> dropping specializing static functions called from these.
> 
> Link: https://lore.kernel.org/all/acruxMNdnUlyRHiy@google.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/linux/init.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/init.h b/include/linux/init.h
> index 5db55c660124..ad5c19763034 100644
> --- a/include/linux/init.h
> +++ b/include/linux/init.h
> @@ -47,7 +47,7 @@
>  #define __initdata	__section(".init.data")
>  #define __initconst	__section(".init.rodata")
>  #define __exitdata	__section(".exit.data")
> -#define __exit_call	__used __section(".exitcall.exit")
> +#define __exit_call	__maybe_unused __section(".exitcall.exit")
>  
>  /*
>   * modpost check for section mismatches during the kernel build.
> -- 
> 2.39.5

