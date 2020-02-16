Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6187160616
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2020 20:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgBPTzq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Feb 2020 14:55:46 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34538 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgBPTzq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Feb 2020 14:55:46 -0500
Received: by mail-ot1-f66.google.com with SMTP id j16so14100607otl.1;
        Sun, 16 Feb 2020 11:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5Gjyg7C/qUM1CPw+L63jimvH6kTtUlFR3Sqxw1W+p/o=;
        b=lR6pcw+9IkkaedVHZLlA7oVkTg+GsqWW5pB1xSMF6JSyYJ0pPVGrJz3gJkpV20osiB
         CQFDoxGbYgRHzyCivCOuetnZyJv8IqC7iD4ma0CxEvw/SoJthsQjg7a0b1P7I+Qg1HbN
         ZhioTfJnICTDO4pMX3vbD0ay3YbcZFBlJqrB57pYCKlubSs7h2GR7UmiLrgTKwR4Oual
         qf1pamjGGztGtePGjhHpl7aM8j2Ci8mVoSPSaxdeRFXqBzSqyLixYJ3autlNYBdIqHqy
         TOWYmN79CZBZpLnJpmipdNG3oGoQ9jMUIlMOAFqCR8yAIehgjIuSV075b0Q+QgUkIYrQ
         FZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5Gjyg7C/qUM1CPw+L63jimvH6kTtUlFR3Sqxw1W+p/o=;
        b=YCQb6+G3OEge2cS2zYBJVQFCiDgmlBa5xjCvRy5D5AwajkRNikVPDhA/0QMPzEUAwn
         tUQsxSKVZOIh1TT+IaUsVqWiy+tEwkv3+iJtGgmqPLU7V30wPN65+GUJWRWkf+rdww0O
         39tQCB8XG97pKxOY/AAL0pLm5j3hV8PcqSCIRov/irfpR74VAhUyx1LxYctdoQasOXoB
         GzAxebBfcAKZ+wvwRZalrKqwrWGxi6zO20LU/hJy0v72k8O5gCUUHFH2m6Yvf5v9KUz3
         M1KTdp3wMUcITYi4hLAPX2lckfYCA3M3X1qF6mV5ULv56EVEn9cS6x7NQpDgYCiZBhVt
         Bvig==
X-Gm-Message-State: APjAAAXtPxbiPb8yGTG+NZkIGcHCdTOrJdLCZRsqURDA1CfS9zMI7IxQ
        EDyWnJ707nYr1Nuj0gvyS9uHY19H
X-Google-Smtp-Source: APXvYqx6s6q6b1AkVg/zx6jWNgJ1f41CXRJ2F3ocrjbfEQFPemxCzbOdldPhiLlgtcRMMzxDXCVLnw==
X-Received: by 2002:a9d:7305:: with SMTP id e5mr9359175otk.64.1581882945402;
        Sun, 16 Feb 2020 11:55:45 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id t203sm4082674oig.39.2020.02.16.11.55.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 11:55:44 -0800 (PST)
Date:   Sun, 16 Feb 2020 12:55:43 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] kbuild: remove cc-option switch from -Wframe-larger-than=
Message-ID: <20200216195543.GA54314@ubuntu-m2-xlarge-x86>
References: <20200216151936.23778-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200216151936.23778-1-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 17, 2020 at 12:19:36AM +0900, Masahiro Yamada wrote:
> This CONFIG option was added by commit 35bb5b1e0e84 ("Add option to
> enable -Wframe-larger-than= on gcc 4.4"). At that time, the cc-option
> check was needed.
> 
> According to Documentation/process/changes.rst, the current minimal
> supported version of GCC is 4.6, so you can assume GCC supports it.
> Clang supports it as well.
> 
> Remove the cc-option switch and redundant comments.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
