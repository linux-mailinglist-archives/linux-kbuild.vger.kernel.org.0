Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F2C22C4ED
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 14:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXMRW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 08:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgGXMRU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 08:17:20 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55473C0619D3;
        Fri, 24 Jul 2020 05:17:20 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id o18so9739725eje.7;
        Fri, 24 Jul 2020 05:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oefsCcIVVC08IrofmdPx+ClRioaDoUfxCbQJCnq9X00=;
        b=NKeRgkjzwebhEdvaagnz02z9Gbq4+7iop3cEpMwqHtM/LhCwRhRIqvho9HrG24s31c
         R+JPr2ZDOPzo1yoeDjdsUCixB+H+tFfza1Smtvm9rk0gQvNDmjuNoCJFriOuZgmJRapK
         YrcfsPnQ8r13I1TbTjX4d33mCzMHRC0hvndXlN9QhxX/wxVZmoIxrdiaxAF465yuJkAR
         dXdMJ7YHjosB4hY3Py4Tn0EutvRu2IdHQfbpURnC0Z7GYeCcfGbPa7ZzqjpGQ32UCRYn
         01PRaADlKEtCbFCo6EyDlaiJZwWS6L3lM+J7lLZNZCqQT//eUBoMJp0lXXnsB2+ZkXqB
         pboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=oefsCcIVVC08IrofmdPx+ClRioaDoUfxCbQJCnq9X00=;
        b=Gea54zsxTtA6n5amJy9Qwuz6162T6Gzfp2eLPnaXOoMGTmDjegcVkEJc8Cfw1r0fQs
         Qo8v3sIngNJ23vOybI+LH8ffs28wbyal+BAO4WIxz5Y4Ve4YuTUbMOCwSg2JjjwVnaPn
         gVVfo8kDHJfKd59KY5GyMeJbIJA+xC4lQI9S+TmG37CcFf+PBAk6RpvQX3pRJ6/HHMwH
         CiL2VA326JUAfdfmKbfQH3gIrTqr2TMxQUSIygKoqUAclDwr4uAEDod5CwHb1k5uA+Fe
         oIg0rvd9nmBs+JnnpwHTbQSxIqgwzUi9hWYKkb9J0R60tZcVaIFREPTNC8nUiEw8HEUt
         ev1g==
X-Gm-Message-State: AOAM530tQvq63fUI+hwsMtY5r8O5DrR76UUGvDmASUFmfAcAaQ5XzjOV
        bDd/W/+k8wSIuZMztsyTsww=
X-Google-Smtp-Source: ABdhPJwp7IkMvGoHQoVYEg7dT3QpDnvecUh+FJ/wqOUSWekmU6eqd6UysOwYDO1LD+uAwfacpE79bg==
X-Received: by 2002:a17:907:aad:: with SMTP id bz13mr9307767ejc.276.1595593039130;
        Fri, 24 Jul 2020 05:17:19 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id i7sm599533eds.91.2020.07.24.05.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 05:17:18 -0700 (PDT)
Date:   Fri, 24 Jul 2020 14:17:16 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v8 3/7] init: add support for zstd compressed kernel
Message-ID: <20200724121716.GB632343@gmail.com>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-4-nickrterrell@gmail.com>
 <9ff49261-f5fd-b8dd-949a-0b8eab75369b@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ff49261-f5fd-b8dd-949a-0b8eab75369b@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Randy Dunlap <rdunlap@infradead.org> wrote:

> On 7/23/20 12:27 PM, Nick Terrell wrote:
> > +config KERNEL_ZSTD
> > +	bool "ZSTD"
> > +	depends on HAVE_KERNEL_ZSTD
> > +	help
> > +	  ZSTD is a compression algorithm targeting intermediate compression
> > +	  with fast decompression speed. It will compress better than GZIP and
> > +	  decompress around the same speed as LZO, but slower than LZ4. You
> > +	  will need at least 192 KB RAM or more for booting. The zstd command
> > +	  line tools is required for compression.
> 
> 	       tools are required

Since 'zstd' is the singular tool required for compression AFAICS:

   LZ4            = lz4c
   XZ             = xz
  +ZSTD           = zstd

"The zstd command line tool is required for compression" is the 
intended wording I'd say?

Thanks,

	Ingo
