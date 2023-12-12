Return-Path: <linux-kbuild+bounces-348-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B3F80F418
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 18:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6635E1C20D49
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Dec 2023 17:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E5A7B3D0;
	Tue, 12 Dec 2023 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="awkWpaIM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7258F99
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Dec 2023 09:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702401003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTsmW17WUzLud/2jzNOtfYA8w5ZvrrOIfNd+fsou+94=;
	b=awkWpaIMdhTUZfIxMwvwXU1U0BH57uW2RXkKr/vBUmMaZpOYJHtI6zdKE+rqfsErgSjt+x
	pFUNvVbtLlGgACqYOO7/paa3r/e6iXLk0KKAZ8GnuyWDATn7xAAJsC8n0yaCA3xm4x+jvq
	dbxwQtuQz323YB+JcENkA/3fZMvGmcM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468--tXLUhjSMvmMspl5p6p7hQ-1; Tue, 12 Dec 2023 12:10:02 -0500
X-MC-Unique: -tXLUhjSMvmMspl5p6p7hQ-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1d33357034eso12414255ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Dec 2023 09:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702401001; x=1703005801;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTsmW17WUzLud/2jzNOtfYA8w5ZvrrOIfNd+fsou+94=;
        b=HOUg3PV5VQf0gZx6ukXVE1XE4HNG7ZuMQPa2vRM3HA3MdWewRZQef5/cEeiA9TRjKY
         GHtzdoww2aRLn/u8je9RQd5bFAMe3PQSttfnL+aVuGUSrVH7rjxpY/GEarbYFk1WTJpF
         /Qg8HhDMMsA7uT2/olTgdwCwRFE0D+uH8nOhZoKIPmZoEdrnxsps6WJLGGgfHFLPDeLD
         hDzTkfOwX8qxLY3tZYFfLIZ5UY7Yj7IVTDR9CDfHYQb2ga6wSowy5YrOoHAfMjAWbRKe
         Dg8qbq9Ino5eN9i39bZ2c0rHo/vnnOsCF7j6NqFsVPiW4rP/0rMC1P082wCO8Sxou4NX
         0Xtw==
X-Gm-Message-State: AOJu0Ywty++/zTFKFVyzaEa0A5YtnaTecGbSIG0l/poef1bHfeGSzzFe
	Wb7Sr44v2eztGfZTB6sCkxyTY3eKqdBDp+51f0d5+60b563GjDixgdDf2tyOI9VGUQE/Tr483N2
	2ZhY65GgEL7jArPkeY7w2h/PA
X-Received: by 2002:a17:902:eb88:b0:1d0:265:6a2c with SMTP id q8-20020a170902eb8800b001d002656a2cmr7793181plg.11.1702401001170;
        Tue, 12 Dec 2023 09:10:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUOPW83vh6/yFOfLem9iMzay8K3e+XQC3CNiFpYGPaAVfwiBjhwWox62jHYqHe8pPGMa2chA==
X-Received: by 2002:a17:902:eb88:b0:1d0:265:6a2c with SMTP id q8-20020a170902eb8800b001d002656a2cmr7793162plg.11.1702401000838;
        Tue, 12 Dec 2023 09:10:00 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:3102:945e:6f76:fb73:6512])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902c40900b001d0969c5b68sm8851113plk.139.2023.12.12.09.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 09:10:00 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
Date: Tue, 12 Dec 2023 14:09:43 -0300
Message-ID: <ZXiT1zyADQVXOEqw@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZXhbUmxzH6nWAzaw@infradead.org>
References: <20231208181802.88528-3-leobras@redhat.com> <ZXgMa57Ere6FJCJB@infradead.org> <CAK7LNAQiJW0eFYQZN0wuURhrdc-8y7=TcEazpxhLf=+mRbKHHQ@mail.gmail.com> <ZXhbUmxzH6nWAzaw@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Dec 12, 2023 at 05:08:34AM -0800, Christoph Hellwig wrote:
> On Tue, Dec 12, 2023 at 05:09:21PM +0900, Masahiro Yamada wrote:
> > Unlike .gitignore, this feature is opt-in rather than enforced.
> > 
> > To use this, you need to run
> > 
> > 'git config diff.orderFile scripts/git.orderFile'
> > 
> > or
> > 
> > 'git diff -C scripts/git.orderFile'
> 
> Oh, ok.  That greatly reduces my concern.

Yes, it's an opt-in, so no user should be directly impacted.

> 
> > 
> > Indeed, the file order is subjective, leaving
> > us a question "do we need it in upstream"?

The main idea is patch generation.
This file's order is supposed to be the best order for reading a raw patch 
and understanding the code changes. 

> > 
> > At least, it is harmless for people who have no interest.
> 
> .. but this is still a good question.  I'm not really sure there is
> much of a need for it, but as long as it doesn't harm everyone else
> I'm at least neutral on it.

diff.orderfile was introduced in git to help order the git diff, and thus 
the patch generation, in a way that it's easier to understand what the 
commit / patch intends on doing. 

Take this example introducing a feature foo, you should see:
- Documentation on foo, if introduced
- How is foo enabled in build system, if needed
- The types / stucts / fields introduced by foo, if any
- The interface for using foo, if any
- The actual foo implementation.

Of course the actual order is open to discussion, and I encourage everyone 
to suggest any other items or order.

Thanks!
Leo


