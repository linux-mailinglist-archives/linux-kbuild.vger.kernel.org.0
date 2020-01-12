Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4944113857F
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Jan 2020 09:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732377AbgALIVq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 Jan 2020 03:21:46 -0500
Received: from mail3.iservicesmail.com ([217.130.24.75]:17620 "EHLO
        mail3.iservicesmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732369AbgALIVq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Jan 2020 03:21:46 -0500
IronPort-SDR: QSZ7tqNlglze8kkwKObX1/m/AzBigizxtoniKzlRdBqZbjmfUxfHjLqLp08G6SekIjcJs95qsW
 B8upzwP4sbtw==
IronPort-PHdr: =?us-ascii?q?9a23=3AVfmWEBynM2ERUwDXCy+O+j09IxM/srCxBDY+r6?=
 =?us-ascii?q?Qd2+MQIJqq85mqBkHD//Il1AaPAdyAraga1KGO7+jJYi8p2d65qncMcZhBBV?=
 =?us-ascii?q?cuqP49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx?=
 =?us-ascii?q?7xKRR6JvjvGo7Vks+7y/2+94fcbglVijexe61+IRS0oAneqsUbjpZpJ7osxB?=
 =?us-ascii?q?fOvnZGYfldy3lyJVKUkRb858Ow84Bm/i9Npf8v9NNOXLvjcaggQrNWEDopM2?=
 =?us-ascii?q?Yu5M32rhbDVheA5mEdUmoNjBVFBRXO4QzgUZfwtiv6sfd92DWfMMbrQ704RS?=
 =?us-ascii?q?iu4qF2QxPujysJKiI2/3vSis1wla5WvhWhpwZnw47TeoGaLuZ+cb3EcdwEQ2?=
 =?us-ascii?q?pNR9pcVzBdAoymc4QPD/QOPeNGoIn7u1sCtAWxBQ+1CO3ozT9IgGH53K0j3+?=
 =?us-ascii?q?s/FwHNwQgsEtwSvHjIqdn4MroZX+Kow6nS1TjNYfNY2S3j5obLbx4uru2DU7?=
 =?us-ascii?q?1rfMrNy0QgCx/JgkmMpYD7OT6ey+QDs3Kc7+plTe+hkXAoqx1vrTi128wjio?=
 =?us-ascii?q?7JhoQaylvZ8ih52Jg6JcGmR05hb9+kF51Qty6BOot2WcMtWH1ntDwmxb0BvJ?=
 =?us-ascii?q?63ZigKyJc+yhPZdveJcJCI7wr9WOqMIzp0nm9pdbyjixqo70StxffwW8e03V?=
 =?us-ascii?q?tMsyFLiMPDtmoX2BzW8sWHT/x98Vq/1juXzADT7/1EIVgzlarGN54t2r4wmY?=
 =?us-ascii?q?QXsUTEBiL2nV/5jK6SdkU+5Oeo7/jrb7r8qp+CMI97lxvxMqopmsy5H+s0KB?=
 =?us-ascii?q?YBX3OD9eS90r3s41H5Ta1UgvErkKTVqo3WKMoHqqKjHQNY3Zwv5hi/Aju+1d?=
 =?us-ascii?q?QXh3gHLFZLeBKdiIjpPknDIOjmAvejnVusijlqx/fAPr3uGZjNLmPDn6z9cr?=
 =?us-ascii?q?pn90Fczw8zwcpf55JXEr0BOu78WlfttNzECR80Kwi0w+fhCNVg2YISQGGPDb?=
 =?us-ascii?q?SEMKPTtV+H+/kiI/eDZIALojbxMfsl6OD0jX8/h1AdebOl3ZwNaHC3TbxaJB?=
 =?us-ascii?q?CdYHzxkpICG3oLugYWUuPnkhuBXCRVanL0WLgztQs2EIa3MYCWfo2xjabJ4y?=
 =?us-ascii?q?C9EdUCfm1aB0qTFnHnd4aEQP0HQC2XK85l1DcDUO7yZZUm0ESWuRP30fJYKe?=
 =?us-ascii?q?zbsnkAuI7uzsdy4eL7lQo4/np/CMHb02LbHDI8pX8BWzJjhfM3mkd60FrWiv?=
 =?us-ascii?q?Agjg=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GeAgAOwxpelyMYgtlNGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBGwgBgSWBTVIgEpNQgU0fg0O?=
 =?us-ascii?q?LY4EAgx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQE?=
 =?us-ascii?q?FBAEBAhABAQEBAQYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVO?=
 =?us-ascii?q?DBIJLAQEznXsBjQQNDQKFHYJEBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ?=
 =?us-ascii?q?/ARIBbIJIglkEjUISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAO?=
 =?us-ascii?q?EToF9ozdXdAGBHnEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GeAgAOwxpelyMYgtlNGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBGwgBgSWBTVIgEpNQgU0fg0OLY4EAgx4VhgcUD?=
 =?us-ascii?q?IFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABAQEBA?=
 =?us-ascii?q?QYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVODBIJLAQEznXsBj?=
 =?us-ascii?q?QQNDQKFHYJEBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ/ARIBbIJIglkEj?=
 =?us-ascii?q?UISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAOEToF9ozdXdAGBH?=
 =?us-ascii?q?nEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,424,1571695200"; 
   d="scan'208";a="303998018"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 12 Jan 2020 07:59:51 +0100
Received: (qmail 24893 invoked from network); 12 Jan 2020 05:00:24 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-kbuild@vger.kernel.org>; 12 Jan 2020 05:00:24 -0000
Date:   Sun, 12 Jan 2020 06:00:19 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     linux-kbuild@vger.kernel.org
Message-ID: <31612984.460939.1578805223956.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

