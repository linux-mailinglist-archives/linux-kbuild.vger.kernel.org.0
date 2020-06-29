Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F9C20E465
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 00:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391055AbgF2VY4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 17:24:56 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:44579 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391035AbgF2VYx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 17:24:53 -0400
Received: by mail-io1-f65.google.com with SMTP id i4so18750107iov.11;
        Mon, 29 Jun 2020 14:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=87SqaZxNff+yYqfasCQQqZpjAwbEEEIdvcnYqAAuoow=;
        b=raHOpONlJ3F0W0G+77T7RD8v5uiojsCoUz8ttuV5xzID0CYKMQe/OVUjj318WI80ye
         Bw7jtABlHokEYfFjjOKFPl1LyZV0dY+lw6omqNZMKa4KfSHnhA2kj43CENFNvPpoNsT0
         PhrPCtVZ9hLPVxhcJ5HstWc77lSnbSEVlDe3OWJyBm8WF3podWwJ/9LruOloJ4ham0xY
         vNyuB5vAqFkBphtPuQljXjWKA28x06MPPLRn39vBiVi8qF+cB4U1RWCjFlRbkNZBw4hR
         yjrGXjccZSR669QAVkF2IB/2U1J6wYFirzp/qw8s49q/BqEJF4FiF8ebpmnbySN23TD7
         sxog==
X-Gm-Message-State: AOAM531j8hIwR/bn9uNZkFb7HUNBTe2tr2n1p4Dx5A5FjVDz50Lj86Ov
        6KyDQBTyQzvWTh1RpcRwPw==
X-Google-Smtp-Source: ABdhPJxf4vWZdQeio9+nDubsephiFPaklOYsiURhz7Xzp48qHtdcC/O/MDM8YbNPeI7rf6GyrTqW3w==
X-Received: by 2002:a6b:c80a:: with SMTP id y10mr18715341iof.67.1593465892414;
        Mon, 29 Jun 2020 14:24:52 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id v62sm621343ila.37.2020.06.29.14.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:24:52 -0700 (PDT)
Received: (nullmailer pid 2934673 invoked by uid 1000);
        Mon, 29 Jun 2020 21:24:49 -0000
Date:   Mon, 29 Jun 2020 15:24:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: do not build processed-schema.yaml for
 'make dt_binding_check'
Message-ID: <20200629212449.GA2934414@bogus>
References: <20200625170434.635114-1-masahiroy@kernel.org>
 <20200625170434.635114-3-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200625170434.635114-3-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 26 Jun 2020 02:04:32 +0900, Masahiro Yamada wrote:
> Currently, processed-schema.yaml is always built, but it is actually
> used only for 'make dtbs_check'.
> 
> 'make dt_binding_check' uses processed-schema-example.yaml instead.
> 
> Build processed-schema.yaml only for 'make dtbs_check'.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/devicetree/bindings/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
